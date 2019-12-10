# This file is generated by uxsdcap 0.1.0.
# https://github.com/duck2/uxsdcxx
# Modify only if your build process doesn't involve regenerating this file.
#
# Cmdline: ../uxsdcap.py rr_graph.xsd
# md5sum of input file: f9c827f7ecf1ac2f15d57c67bbba4399

@0xd66cda3fb80f116e;
using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("ucap");

enum SwitchType {
	uxsdInvalid @0;
	mux @1;
	tristate @2;
	passGate @3;
	short @4;
	buffer @5;
}

enum PinType {
	uxsdInvalid @0;
	open @1;
	output @2;
	input @3;
}

enum NodeType {
	uxsdInvalid @0;
	chanx @1;
	chany @2;
	source @3;
	sink @4;
	opin @5;
	ipin @6;
}

enum NodeDirection {
	uxsdInvalid @0;
	incDir @1;
	decDir @2;
	biDir @3;
}

enum LocSide {
	uxsdInvalid @0;
	left @1;
	right @2;
	top @3;
	bottom @4;
}

struct Channel {
	chanWidthMax @0 :Int32;
	xMax @1 :Int32;
	xMin @2 :Int32;
	yMax @3 :Int32;
	yMin @4 :Int32;
}

struct XList {
	index @0 :UInt32;
	info @1 :Int32;
}

struct YList {
	index @0 :UInt32;
	info @1 :Int32;
}

struct Channels {
	channel @0 :Channel;
	xLists @1 :List(XList);
	yLists @2 :List(YList);
}

struct Timing {
	cin @0 :Float32;
	cinternal @1 :Float32;
	cout @2 :Float32;
	r @3 :Float32;
	tdel @4 :Float32;
}

struct Sizing {
	bufSize @0 :Float32;
	muxTransSize @1 :Float32;
}

struct Switch {
	id @0 :Int32;
	name @1 :Text;
	type @2 :SwitchType;
	timing @3 :Timing;
	sizing @4 :Sizing;
}

struct Switches {
	switches @0 :List(Switch);
}

struct SegmentTiming {
	cPerMeter @0 :Float32;
	rPerMeter @1 :Float32;
}

struct Segment {
	id @0 :Int32;
	name @1 :Text;
	timing @2 :SegmentTiming;
}

struct Segments {
	segments @0 :List(Segment);
}

struct Pin {
	ptc @0 :Int32;
	value @1 :Text;
}

struct PinClass {
	type @0 :PinType;
	pins @1 :List(Pin);
}

struct BlockType {
	height @0 :Int32;
	id @1 :Int32;
	name @2 :Text;
	width @3 :Int32;
	pinClasses @4 :List(PinClass);
}

struct BlockTypes {
	blockTypes @0 :List(BlockType);
}

struct GridLoc {
	blockTypeId @0 :Int32;
	heightOffset @1 :Int32;
	widthOffset @2 :Int32;
	x @3 :Int32;
	y @4 :Int32;
}

struct GridLocs {
	gridLocs @0 :List(GridLoc);
}

struct NodeLoc {
	ptc @0 :Int32;
	side @1 :LocSide;
	xhigh @2 :Int32;
	xlow @3 :Int32;
	yhigh @4 :Int32;
	ylow @5 :Int32;
}

struct NodeTiming {
	c @0 :Float32;
	r @1 :Float32;
}

struct NodeSegment {
	segmentId @0 :Int32;
}

struct Meta {
	name @0 :Text;
	value @1 :Text;
}

struct Metadata {
	metas @0 :List(Meta);
}

struct Node {
	capacity @0 :UInt32;
	direction @1 :NodeDirection;
	id @2 :UInt32;
	type @3 :NodeType;
	loc @4 :NodeLoc;
	timing @5 :NodeTiming;
	segment @6 :NodeSegment;
	metadata @7 :Metadata;
}

struct RrNodes {
	nodes @0 :List(Node);
}

struct Edge {
	sinkNode @0 :UInt32;
	srcNode @1 :UInt32;
	switchId @2 :UInt32;
	metadata @3 :Metadata;
}

struct RrEdges {
	edges @0 :List(Edge);
}

struct RrGraph {
	toolComment @0 :Text;
	toolName @1 :Text;
	toolVersion @2 :Text;
	channels @3 :Channels;
	switches @4 :Switches;
	segments @5 :Segments;
	blockTypes @6 :BlockTypes;
	grid @7 :GridLocs;
	rrNodes @8 :RrNodes;
	rrEdges @9 :RrEdges;
}