var Comment = React.createClass({
  render: function () {
    return (
      <li id={ this.props.message.uid }>
        <div className="avatar">
          <img src={ this.props.message.avatar } />
        </div>
        <div className="messages">
          <p>{ this.props.message.content }</p>
          <time dateTime={ this.props.message.created_at } className="date">
            { "@"+this.props.message.user + " • "+ this.props.message.date_formatted + " ago" }
          </time>
        </div>
      </li>
      )
  }
});