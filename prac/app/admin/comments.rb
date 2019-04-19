ActiveAdmin.register Comment, as: "UserComment" do
permit_params :commenter, :body
end
