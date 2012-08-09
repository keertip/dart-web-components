// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * TodoMVC sample application written with web-components and manually bound
 * models. This example uses mirrors to implements Dart-adapted MDV templates.
 */
#library('output_todo');

#import('dart:html');

// Code from components
#import('footer.dart');
#import('newform.dart');
#import('item.dart');
#import('toggleall.dart');
// TODO(jmesserly): ideally these would be package: imports
#import('../../../list_component.dart');
#import('../../../if_component.dart');

#import('model.dart');
#import('../../../watcher.dart');
#import('../../../webcomponents.dart');

main() {
  initializeComponents(viewModel);

  // listen on changes to #hash in the URL
  window.on.popState.add((_) {
    viewModel.showIncomplete = window.location.hash != '#/completed';
    viewModel.showDone = window.location.hash != '#/active';
    dispatch();
  });
}