### every part of the library that you can fetch:

<br>

<table>

<tr> <td> <b> Protos: </b> </td> <td> <code>Table</code> </td> <td> Base </td> <td> global table used to store classes </td> </tr>

<tr> <td> <b> Config: </b> </td> <td> <code>Table</code> </td> <td> Config </td> <td> self explanatory </td> </tr>

<tr> <td> <b> rbx: </b> </td> <td> <code>Boolean</code> </td> <td> Base </td>  <td> checks if it's in a luau environment </td> </tr>

<tr> <td> <b> baseprint: </b> </td> <td> <code>Function</code> </td> <td> Base </td> <td> used for tostring stuff </td> </tr>

<tr> <td> <b> class: </b> </td> <td> <code>Function</code></td> <td> Keyword </td> <td> used for creating new class prototypes </td> </tr>

<tr> <td> <b> new: </b> </td> <td> <code>Function</code> </td> <td> Keyword </td> <td> used for creating new class instances </td> </tr>

<tr> <td> <b> extend: </b> </td> <td> <code>Function</code> </td> <td> Keyword </td> <td> used for creating new classes off of another </td> </tr>

<tr> <td> <b> getclass: </b> </td> <td> <code>Function</code> </td> <td> Method </td> <td> gets a class prototype </td> </tr>

<tr> <td> <b> isa: </b> </td> <td> <code>Function</code> </td> <td> Method </td> <td> checks if a class instance matches up with a name or Prototype </td> </tr>

<tr> <td> <b> dump: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> cooler print for tables and class instances </td> </tr> 

<tr> <td> <b> fid: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> gets function ids </td> </tr> 

<tr> <td> <b> fname: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> gets function names </td> </tr>

<tr> <td> <b> pad: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> pads strings with content </td> </tr>

<tr> <td> <b> rawtostring: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> gets the raw tostring returns of something, ignoring __tostring in tables </td> </tr>

<tr> <td> <b> shallow: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> creates a shallow copy of tables </td> </tr>

<tr> <td> <b> tid: </b> </td> <td> <code>Function</code> </td> <td> Misc </td> <td> gets table ids </td> </tr> 

<tr> <td> <b> __metaindex: </b> </td> <td> <code>Function</code> </td> <td> Event </td> <td> __index function for class instances </td> </tr> 

<tr> <td> <b> __metanewindex: </b> </td> <td> <code>Function</code> </td> <td> Event </td> <td> __newindex function for class instances </td> </tr>

<tr> <td> <b> __metatostring: </b> </td> <td> <code>Function</code> </td> <td> Event </td> <td> __tostring function for class instances </td> </tr>

<tr> <td> <b> __protoindex: </b> </td> <td> <code>Function</code> </td> <td> Event </td> <td> __index function for Prototypes </td> </tr>

<tr> <td> <b> __protonewindex: </b> </td> <td> <code>Function</code> </td> <td> Event </td> <td> __newindex function for Prototypes </td> </tr>

<tr> <td> <b> Prototype: </b> </td> <td> <code>Metatable</code> </td> <td> Class </td> <td> type for class Prototypes </td> </tr> 

<tr> <td> <b> PrototypeItem: </b> </td> <td> <code>Metatable</code> </td> <td> Class </td> <td> type for class properties </td> </tr>

<tr> <td> <b> Object: </b> </td> <td> <code>Table</code> </td> <td> Class </td> <td> lets you get and set PrototypeItems </td> </tr>

</table>