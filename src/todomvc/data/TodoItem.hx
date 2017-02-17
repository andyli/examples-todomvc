package todomvc.data;

import coconut.data.Model;

class TodoItem implements Model {
  static var UID : UInt = 0;
  static var calls : UInt = 0;
  
  @:editable var completed:Bool = @byDefault false;
  @:editable var description:String;
  
  @:editable var uid:Int = @byDefault UID++;

  @:constant var created:Date = @byDefault Date.now();
  @:computed var label : String = uid + description;
  
  @:computed var test : String = label + ": " + uid + " was called " + (++calls);

  public function getTest()
    return label + ": " + UID;

  static public function create(description:String) 
    return new TodoItem({ description: description });//Constructor is autogenerated

  static public function isActive(item:TodoItem)
    return !item.completed;

  static public function isCompleted(item:TodoItem)
    return item.completed;

}