class genetic_algorithm

  def deep_copy(a)
    Marshal.load(Marshal.dump(a))
  end

  def main_algorithm
  end

  def make_test_shift_array
    shift =[]
    coma_num = 64
    mentor_num = 10
    coma_num.times do
      array = []
      mentor_num.times do
        if rand(10) > 3
          array << []
        elsif rand(10) > 7
          array << [1,2,3,4,5]
        else
          array << [3,4,5]
        end
      end
      shift << deep_copy(array)
    end
    return shift
  end


  def decide_important_job(job_id, necessary_personnel_num, available_shift)
    available_shift.map do |coma_shift|
      job_number = []
      coma_shift.map.with_index do |shift, i|
        if shift.include?(job_id)
          find_job = true
          job_number << i
          shift.delete(job_id)
        else
          shift
        end
      end
      unless job_number.empty?
        job_number.shuffle.each_with_index do |job_num, i|
          break if necessary_personnel_num < i
          coma_shift[job_num] = job_id
        end
      end
      coma_shift
    end
    available_shift
  end

  def init_coma_shift(available_shift)
    shift = decide_important_job(1,1,available_shift)
    shift = decide_important_job(2,1,shift)
    shift = decide_important_job(3,,1,shift)
    shift = decide


end
