FactoryGirl.define do
    factory :vote do
        x = rand(1..100)

        if x%2 == 0
            value 1
        else
            value -1
        end
    end
end
