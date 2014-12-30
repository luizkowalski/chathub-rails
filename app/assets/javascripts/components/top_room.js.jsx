var TopRoom = React.createClass({

  render: function() {
    return (
       <div className="well col-room room-fire text-center">
        <img src={ this.props.top_room.avatar } className="top-room-avatar  img-circle"/>
        <p>
          <a href={ "/rooms/" + this.props.top_room.name }>{ this.props.top_room.name }</a>
        </p>
        <p>{ this.props.top_room.count } messages </p>
      </div>
      )
  }
});
