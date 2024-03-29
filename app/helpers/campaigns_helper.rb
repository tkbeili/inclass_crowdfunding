module CampaignsHelper

  def label_class(state)
    case state.to_sym
    when :draft then "label label-default"
    when :published then "label label-primary"
    when :target_met then "label label-info"
    when :succeeded then "label label-success"
    when :failed then "label label-danger"
    when :canceled then "label label-danger"
    end
  end

end