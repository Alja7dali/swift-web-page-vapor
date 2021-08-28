let makeStyle = {
  return style {
    selector("body") {
      padding(.rem(0.5))
      lineHeight(1.35)
      fontFamily("SanFranciscoDisplay-Regular")
    }
    
    selector("blockquote") {
      borderLeft(width: .px(2), style: .solid, color: .hex(0x777))
      fontStyle(.italic)
      color(.hex(0x777))
      marginLeft(.rem(1))
      paddingLeft(.rem(0.5))
    }
    
    selector("pre") {
      backgroundColor(.hex(0xf3f3f3))
      padding(.rem(0.5))
      overflowX(.scroll)
    }
    
    selector("code") {
      backgroundColor(.hex(0xf3f3f3))
      padding(.rem(0.25))
    }
    
    selector("li:not(:last-child)") {
      marginBottom(.rem(0.25))
    }
    
    selector("h2") {
      marginTop(.rem(2))
      marginBottom(.px(0))
    }
  }
}