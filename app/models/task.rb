class Task

  PROPERTIES = [:title, :notes, :due_date, :completed]

  PROPERTIES.each do |property|
    attr_accessor property
  end

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member?(key.to_sym)
        self.send("#{key}=", value)
      end
    end
  end

  def initWithCoder(decoder)
    self.init
    PROPERTIES.each do |property|
      saved_value = decoder.decodeObjectForKey(property.to_s)
      send("#{property}=", saved_value)
    end
    self
  end

  def encodeWithCoder(encoder)
    PROPERTIES.each do |property|
      encoder.encodeObject(send(property), forKey: property.to_s)
    end
  end

  # So far I've used "task", "taskx"
  TASK_KEY = "list"

  def self.save_tasks(list)
    tasks_as_data = list.map do |task|
      NSKeyedArchiver.archivedDataWithRootObject(task)
    end
    defaults = NSUserDefaults.standardUserDefaults
    defaults.setObject(tasks_as_data, forKey: TASK_KEY)
    tasks_as_data = defaults.arrayForKey(TASK_KEY)
  end

  def self.load_tasks
    defaults = NSUserDefaults.standardUserDefaults
    tasks_as_data = defaults.objectForKey(TASK_KEY)
    return [] if tasks_as_data == nil
    list = tasks_as_data.map do |encoded_task|
      NSKeyedUnarchiver.unarchiveObjectWithData(encoded_task)
    end
    list
  end

end
