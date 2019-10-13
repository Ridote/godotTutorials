
# Level 1. Pong

What is pong? Pong is the first game ever made in October 1958, by William Higinbotham. The game basically consists on two bars on each side of the field and a ball that will bounce on the north and south wall and on the bars. If the wall bounces on any of the side walls, the player on that side will lose. Sounds easy, right? Well, nowadays it is!

# Godot Basics

## Introduction

What is Godot? Godot is a free open source videogame engine. It is under a MIT license, which means you can do with it whatever you want. Even renaming it and selling it under another name :')

Godot is based on scenes and nodes. Everything you create in Godot is a scene. And you can use those scenes as nodes of other scenes. At the beginning, this might not appear very attractive for some people (at least it was my first impression), but after some playing with it it's one of my favourite things in Godot. It simplifies things in a really good manner.

### Scenes

There are three main type of scenes:

#### Node2D

All 2D nodes will inherit from this node and it has some common functionality we will cover later in this basic series.

#### Node3D

All 3D nodes will inherit from this node and it has some common functionality we will cover later in this basic series.

#### Control

All GUI nodes will inherit from this node and it has some common functionality we will cover later in this basic series.

## Coding with Godot

There are two oficially supported languages in Godot: GDscript and C#. The examples in the documentation are in both of them. See it in this [example](https://docs.godotengine.org/en/3.1/tutorials/physics/rigid_body.html "codeExample"), there is a table with a tab to change from GDscript to C#.

You could also use GDNative with C++ to make calls to the Godot library and not make any use of GDScript or C#, or even make your own wrappers for other languages (although some of them might already exist so you don't need to do them yourself!).

For this series, we will do everything using GDScript since the examples we will build won't need to do any heavy lifting GDScript can't handle (or if so, we could make calls to C++ code from GDScript).

GDScript is a scripting language Python alike. There are no braces and you are expected to indent everything. Since this series are for people with some basics in programming, we'll let you take a look at the basics from the official documentation:
[GDScript Basics](https://docs.godotengine.org/en/3.1/getting_started/scripting/gdscript/gdscript_basics.html "gdscript_basics").

# Designing a pong

First things first, we need to design what we want to achieve. Lets see what we need in order to implement a pong:

1. Bars.
    There will be two bars, one for the first player and one for either the second player or the IA of the game.
2. Walls.
    There will be four walls: north, south, east and west.
3. Menu
    1. Single Player
    2. Duel
    3. Settings. It will contain audio options
    4. Exit
4. Points GUI. A graphic interface that will show how many points both players have scored

Let's go forward and backward implementing things as we need, starting with the bars.

## StaticBody2D, KinematicBody2D, RigidBody2D

First things first, we need to implement collisions with Godot. Luck for you, this is already implemented so you only need to worry about moving things in the screen, Godot will do the rest. There are three nodes we can use for this: Static, Kinematic and Rigid. You might have heard of them if you've used other engines or libraries like Unity, libgdx, pygame, etc. If not, this is a brief description of what they do.

### Static

Static bodies are bodies that collide with other bodies but won't move, at all. That means, if you want a body to move, even if it's part of the environment in your world, you do not want to use this. These bodies are usually used to create floors and walls. You could create walls or floors with kinematics or even rigids, but you don't want to do that since they are more expensive to process!!

### Kinematic

Kinematic bodies are bodies that can move, but that don't use physics. You need to implement the physics yourself. They are used when you don't need realistic physics so you can implement a more basic implementation of physics so it's lighter to process. You do not want to use these if you are creating a pool game or something where you want physics to be realistic, but most of the times Kinematic are what you most probably need. Also, you can implement parts of the environment that will move, like platforms in movement.

### Rigid

Rigid bodies are bodies that implement realistic physics. They are expensive to process and most of the times is not what you need.

# TODO
