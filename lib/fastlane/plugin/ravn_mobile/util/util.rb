# @param [Object] obj
# @return [TrueClass, FalseClass]
def blank?(obj)
  return obj.strip.empty? if obj.is_a?(String)

  obj.respond_to?(:empty?) ? obj.empty? : !obj
end
