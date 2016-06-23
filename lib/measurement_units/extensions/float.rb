class Float

  def formated
    self % 1 === 0 ? self.to_i : self
  end

end
