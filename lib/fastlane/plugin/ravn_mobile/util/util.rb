# @param [Object] obj
# @return [TrueClass, FalseClass]
def blank?(obj)
  return obj.strip.empty? if obj.kind_of?(String)

  obj.respond_to?(:empty?) ? obj.empty? : !obj
end
