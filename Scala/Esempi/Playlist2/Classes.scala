//Classes are blueprint to creating object

//var : getter and setter
//val : only getter
//default : cannot set and cannot get


class User(var name:String,var age:Int){ //if i want the name as private i can write class User(private var name:String...)
    //Auxiliary Constructors :
        //Signature must be different to other costructor
        //It Must call the class costructor

    def this() ={
        this("Tom",1)
    }

    def this(name:String) ={
        this(name,1)
    }
    
    //to String Override
    override def toString(): String = {

        "name: "+ name+" age: "+age
    }
}


object  Classes{//This is a singleton class so i cannot create an istance of this


    def main (args:Array[String]):Unit = {
        var user1 = new User("Jimmy",20) //instance of user
        var user2 = new User("John")
        var user3 = new User()
        println(user1)
        println(user2)
        println(user3)
    }
}

