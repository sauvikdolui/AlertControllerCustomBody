# AlertControllerCustomBody
Example of adding custom body UI component in `UIAlertController`

### How to get the body of the UIAlertController?

    let watingListAlert = UIAlertController(title: "Lista De espera", message: "Algunos días seleccionados, no poseen disponibilidad en el chárter. Puede inscribirse a la lista de espera y el sistema lo tendrá en cuenta cuando algún espacio se libere\n\n\n", preferredStyle: .alert)
    
    
    if let alertContentView = watingListAlert.view.subviews[0].subviews.last?.subviews.first?.subviews.first?.subviews[0] {
      
      
      //  let titleLabel = alertContentView.subviews[0] as! UILabel
      //  let messageLabel = alertContentView.subviews[1] as! UILabel
      
      // Create your own UI Components here
      let button = UIButton(type: .contactAdd)
      
      // Add it to the body of the alert controller view
      alertContentView.addSubview(button)      
    }
    
### Demo GIF
![Example](https://github.com/sauvikatinnofied/AlertControllerCustomBody/blob/master/giphy.gif)
