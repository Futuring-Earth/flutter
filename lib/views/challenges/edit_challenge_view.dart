import 'dart:io';

import 'package:app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/challenge.dart';
import '../../view_models/challenges/challenge_viewmodel.dart';

class EditChallengesView extends StatefulWidget {
  static const routeName = '/edit-challenge';

  @override
  _EditChallengeViewState createState() => _EditChallengeViewState();
}

class _EditChallengeViewState extends State<EditChallengesView> {
  final _durationFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  var _editedChallenge = Challenge(
    title: '',
    description: '',
    imageUrl: '',
    duration: 0,
    minTeamSize: 0,
    maxTeamSize: 0,
    co2Impact: 0.0,
    overallRaiting: 0.0,
  );
  var _initValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
    'duration': 0,
    'minTeamSize': 0,
    'maxTeamSize': 0,
    'co2Impact': 0.0,
    'overallRaiting': 0.0,
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final challengeId = ModalRoute.of(context).settings.arguments as String;
      if (challengeId != null) {
        _editedChallenge =
            Provider.of<ChallengeViewModel>(context, listen: false)
                .findById(challengeId);
        _initValues = {
          'title': _editedChallenge.title,
          'description': _editedChallenge.description,
          // 'imageUrl': _editedChallenge.imageUrl,
          'imageUrl': '',
          'duration': _editedChallenge.duration,
          'minTeamSize': _editedChallenge.minTeamSize,
          'maxTeamSize': _editedChallenge.maxTeamSize,
          'co2Impact': _editedChallenge.co2Impact,
          'overallRaiting': _editedChallenge.overallRaiting,
        };
        _imageUrlController.text = _editedChallenge.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _durationFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid || _pickedImage == null) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    //TODO: Save the image: _pickedImage

    if (_editedChallenge.id != null) {
      await Provider.of<ChallengeViewModel>(context, listen: false)
          .updateChallenge(_editedChallenge);
    } else {
      try {
        await Provider.of<ChallengeViewModel>(context, listen: false)
            .addChallenge(_editedChallenge);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Challenge'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_durationFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedChallenge = Challenge(
                            title: value,
                            description: _editedChallenge.description,
                            imageUrl: _editedChallenge.imageUrl,
                            id: _editedChallenge.id,
                            duration: _editedChallenge.duration,
                            minTeamSize: _editedChallenge.minTeamSize,
                            maxTeamSize: _editedChallenge.maxTeamSize,
                            co2Impact: _editedChallenge.co2Impact,
                            overallRaiting: _editedChallenge.overallRaiting);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['duration'].toString(),
                      decoration: InputDecoration(labelText: 'Duration'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _durationFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a duration.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedChallenge = Challenge(
                            title: _editedChallenge.title,
                            description: _editedChallenge.description,
                            imageUrl: _editedChallenge.imageUrl,
                            id: _editedChallenge.id,
                            duration: int.parse(value),
                            minTeamSize: _editedChallenge.minTeamSize,
                            maxTeamSize: _editedChallenge.maxTeamSize,
                            co2Impact: _editedChallenge.co2Impact,
                            overallRaiting: _editedChallenge.overallRaiting);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 10) {
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedChallenge = Challenge(
                            title: _editedChallenge.title,
                            description: value,
                            imageUrl: _editedChallenge.imageUrl,
                            id: _editedChallenge.id,
                            duration: _editedChallenge.duration,
                            minTeamSize: _editedChallenge.minTeamSize,
                            maxTeamSize: _editedChallenge.maxTeamSize,
                            co2Impact: _editedChallenge.co2Impact,
                            overallRaiting: _editedChallenge.overallRaiting);
                      },
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
    );
  }
}
