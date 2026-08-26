import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FloatingAddButton extends StatefulWidget { final VoidCallback onPressed; const FloatingAddButton({super.key,required this.onPressed}); @override State<FloatingAddButton> createState()=>_FloatingAddButtonState(); }
class _FloatingAddButtonState extends State<FloatingAddButton> with SingleTickerProviderStateMixin { late final AnimationController c; @override void initState(){super.initState();c=AnimationController(vsync:this,duration:const Duration(milliseconds:450));} @override void dispose(){c.dispose();super.dispose();} @override Widget build(BuildContext context)=>ScaleTransition(scale:Tween(begin:.92,end:1.0).animate(CurvedAnimation(parent:c,curve:Curves.elasticOut)),child:FloatingActionButton(onPressed:(){c.forward(from:0);widget.onPressed();},backgroundColor:AppTheme.accent,foregroundColor:Colors.white,elevation:10,shape:const CircleBorder(),child:const Icon(Icons.add_rounded,size:30))); }
