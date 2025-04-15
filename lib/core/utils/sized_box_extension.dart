import 'package:flutter/material.dart';

/// An extension on `int?` to provide convenient `SizedBox` and `SliverToBoxAdapter` helpers.
extension IntExtension on int? {
  /// Returns the integer value if not null; otherwise, returns the provided [value] (default is 0).
  int validate({int value = 0}) {
    return this ?? value;
  }

  /// Creates a vertical space of `this` height using `SizedBox`.
  ///
  /// Example:
  /// ```dart
  /// 20.kh, // Adds 20 pixels of vertical spacing
  /// ```
  Widget get kh => SizedBox(height: this?.toDouble());

  /// Creates a horizontal space of `this` width using `SizedBox`.
  ///
  /// Example:
  /// ```dart
  /// 10.kw, // Adds 10 pixels of horizontal spacing
  /// ```
  Widget get kw => SizedBox(width: this?.toDouble());

  /// Creates a vertical space of `this` height inside a `SliverToBoxAdapter`.
  ///
  /// Useful for adding spacing inside `CustomScrollView`.
  ///
  /// Example:
  /// ```dart
  /// SliverList(
  ///   delegate: SliverChildListDelegate(
  ///     [
  ///       20.sKh, // Adds 20 pixels of vertical space in a sliver layout
  ///     ],
  ///   ),
  /// ),
  /// ```
  Widget get sKh =>
      SliverToBoxAdapter(child: SizedBox(height: this?.toDouble()));

  /// Creates a horizontal space of `this` width inside a `SliverToBoxAdapter`.
  ///
  /// This is rarely used, but can be helpful in some `Sliver` layouts.
  ///
  /// Example:
  /// ```dart
  /// SliverList(
  ///   delegate: SliverChildListDelegate(
  ///     [
  ///       10.sKw, // Adds 10 pixels of horizontal space in a sliver layout
  ///     ],
  ///   ),
  /// ),
  /// ```
  Widget get sKw =>
      SliverToBoxAdapter(child: SizedBox(width: this?.toDouble()));
}
