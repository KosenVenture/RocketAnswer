class ExpStoriesController < InheritedResources::Base

	private

    def exp_story_params
      params.require(:exp_story).permit(:advice)
    end
end

