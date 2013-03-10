import com.nfldraftscience.domain.Player
import com.nfldraftscience.domain.Position
import com.nfldraftscience.domain.User

class BootStrap {

    def init = { servletContext ->
        
        if(!Player.count) {
            new Player(firstName: "Joe", lastName: "Montana", height: 74, weight: 205, number: 16, pos: Position.QB).save(failOnError: true)
            new Player(firstName: "Steve", lastName: "Young", height: 74, weight: 215, number: 8, pos: Position.QB).save(failOnError: true)
            new Player(firstName: "Barry", lastName: "Sanders", height: 68, weight: 200, number: 20, pos: Position.RB).save(failOnError: true)
            new Player(firstName: "Marshall", lastName: "Faulk", height: 70, weight: 211, number: 28, pos: Position.RB).save(failOnError: true)
            new Player(firstName: "Jerry", lastName: "Rice", height: 74, weight: 200, number: 80, pos: Position.WR).save(failOnError: true)
            new Player(firstName: "Randy", lastName: "Moss", height: 76, weight: 210, number: 84, pos: Position.WR).save(failOnError: true)
            new Player(firstName: "Brent", lastName: "Jones", height: 76, weight: 235, number: 84, pos: Position.TE).save(failOnError: true)
            new Player(firstName: "Tony", lastName: "Gonzalez", height: 77, weight: 250, number: 88, pos: Position.TE).save(failOnError: true)
        }
        
        if(!User.count) {
            new User(username: "admin").save(failOnError: true);
            new User(username: "coachTompson").save(failOnError: true);
        }
        
        
        
    }
    def destroy = {
    }
}
