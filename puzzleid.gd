extends Node

var puzzle1 = {
	"puzzlelength" : 2,
	"picarats" : 10,
	"originalpicarats" : 10,
	"puzzletitle" : "Pill Prescription",
	"puzzletext" :"A man has been prescribed 10 pills. Starting today, he must take one pill a day, but because the concentration of the medicine is different in each pill, he must take them in a specific order. Since the pills all look the same, the man has decided to write numbers on each pill to help him remember the order he needs to take them in. How many pills does he have to number if he wants to keep track of the order?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "If the man wants to indicate the order in which he needs to take his pills, he just needs to write a number on each of the 10 pills. While that's true, the bare minimum of numbers he needs to write is fewer than 10. Think about how he can accomplish this.",
	"hint2text" : "When you have two visually identical items, you only need to mark one of them. Therefore, you don't need to mark each pill to tell them apart.",
	"hint3text" : "Keep in mind that the man must start taking his pills today. In fact, he's going to start by taking the pill right in front of him. If that's the case, does he really need to mark which pill he's going to take today?",
	"hint4text" : "The amount of pills the man must number is 8.",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle2 = {
	"ButtonA" : "Girl",
	"ButtonB" : "Boy",
	"picarats" : 30,
	"originalpicarats" : 30,
	"puzzletitle" : "The Third Youngest",
	"puzzletext" :"There are 10 siblings living together. Luke, let us say you are the eighth child. The oldest daughter is the second son's younger sister and the third son's older sister. The fourth son is the second daughter's older brother and the oldest daughter's little brother. There are no boys in between the third and fourth daughters. Got all that? Is the third-youngest child a b or a girl?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 1,
	"hintsgiven" : 0,
	"hint1text" : "You weren't confounded by that circumlocutory explanation, were you? Read the puzzle again from the very beginning.",
	"hint2text" : "Is trying to comprehend all of those conditions too much of a pain? If you're thinking that way, here's a word to the wise: this is actually a very simple puzzle...",
	"hint3text" : "Out of the 10 siblings, Luke is the eighth child... How many siblings are younger than Luke?",
	"hint4text" : "Out of the 10 siblings, the third-youngest child is the same as the eight! And Luke certainly isn't a girl, so...",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle3 = {
	"ButtonA" : "4:00 am",
	"ButtonB" : "2:30 pm",
	"ButtonC" : "12:00 am",
	"ButtonD" : "6:00 am",
	"picarats" : 25,
	"originalpicarats" : 25,
	"puzzletitle" : "Bus Scheduling",
	"puzzletext" :"It takes you one hour to get to the office by bus. Your work takes two hours to complete, after which you catch the bus home. Based on the departure times listed below, which bus, A,B,C, or D, should you take to work in order to minimize the wait for a ride home? Note: The departure times for the buses home are 5:00 am, 10:30 am, 5:00 pm,  8:00 pm, & 12:00 am.",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 2,
	"hintsgiven" : 0,
	"hint1text" : "It doesn't matter what time you get to work, so you can take any of the buses and be fine. But once you get there, you're stuck taking whatever bus leaves the soonest after you finished working. Start your thinking from there.",
	"hint2text" : "For example, suppose there was a bus you could take to the office at 12:30pm. In this case, you would arrive at 1:30pm. It takes two hours to finish your work, so by the time you were done, it would be 3:30pm. That's the soonest you could catch a bus home. So for each of the buses going to the office, figure out what time you'd be done working and ready for a ride home.",
	"hint3text" : "You're not overlooking any choices because they seem to late, are you? As long as you get your work done, you can show up at whatever time works best for you.",
	"hint4text" : "Go to work late, head home first thing in the morning: this schedule is the most time effective, so which bus is it?",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle4 = {
	"puzzlelength" : 1,
	"picarats" : 30,
	"originalpicarats" : 30,
	"puzzletitle" : "Brothers 'n' Sisters",
	"puzzletext" :'Below are three siblings: A, B, and C. A: "I have one older brother and three younger sisters." B: "I have two older brothers and two younger sisters." C: "I have three older brothers and one younger sister." For all of their statements to be true, what is the smallest possible number of siblings there can be in the family?',
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "Think about A, B and C. Who's the oldest? Who's the youngest?",
	"hint2text" : "You know that A is the oldest, followed by B and then C. A also has an older brother. C also has a younger sister.",
	"hint3text" : "Try making a chart laying out the conditions of Hint Two, and mark the genders of each known sibling. You should make an important realization. Also, just so you're clear, A is a male and B is a female.",
	"hint4text" : "There are more than five siblings. If A has three younger sisters and C has three older brothers, than there must be at least three female siblings and three male siblings.",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle5 = {
	"puzzlelength" : 2,
	"picarats" : 40,
	"originalpicarats" : 40,
	"puzzletitle" : "Four Horses",
	"puzzletext" :"You have four horses, all of which travel at different speeds. In traveling form point A to point B, these horses take one, two, four, and six hours respectively. One day, you decide to move all your horses from point A to point B. However, you can only move a maximum of two horses at a time, and you need to ride a horse back to point A each time you return to move your other horses. Knowing you can only move as fast as the slowest horse you're traveling with, what's the fewest number of hours it will take to complete your move?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "When crossing back over from B to A, you want to move as quickly as possible, so make sure you put yourself in a position to cross over to A on the one-hour horse when possible.",
	"hint2text" : "In order to move all your horses from A to B in the shortest amount of time, you'll need to cross over from A to B three times and return from B to A twice. How do you make the most effective use of this limited number of crossings?",
	"hint3text" : "First, bring your one-hour and two-hour horses over to B, then return to A on your one-hour horse. Next, bring your four- and six-hour horses over to B and return to A on your two-hour horse.",
	"hint4text" : "There are 5 rides there and back being 2 hours long, 1 hour long, 6 hours long, 2 hours long, and 2 hours long. What is 2+1+6+2+2?",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle6 = {
	"puzzlelength" : 1,
	"picarats" : 30,
	"originalpicarats" : 30,
	"puzzletitle" : "Moving Day",
	"puzzletext" :"Two men are moving boxes from the first floor to the third. The larger man can carry two boxes at a time, and it takes him one minute to get to the third floor. The smaller man can carry only one box at a time, but it takes him just 30 seconds to make it to the third floor. For both men, the return trip to the first floor is the same as the trip up. If there were seven boxes total, how many minutes would it take the men to get all the boxes to the third floor?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "You can get the answer by calculating everything out, but it's a lot easier to visualize if you use the Memo function. After one minute has passed, how many boxes have been moved? And where are the locations of the two men at that time?",
	"hint2text" : "After a minute is up, the larger man has carried two boxes up and the smaller man has carried one. The larger man is still upstairs, though, while the little guy has made it back down to the first floor. If this is the case, what's their progress after two minutes?",
	"hint3text" : "At the end of two minutes, the larger fellow has made it down to the first floor again and is ready to bring up some more boxes. The little guy has brought another box upstairs, for a total of four boxes on the third floor. That means there are just three boxes left to move.",
	"hint4text" : "In the earlier hints, you learned that after two minutes have passed, four boxes had been brought upstairs and both men were back down on the first floor. If it takes 30 seconds for the little guy to get upstairs with one box, and the larger fellow can make it upstairs with two boxes in a minute...",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle7 = {
	"ButtonA" : "Friday",
	"ButtonB" : "Saturday",
	"ButtonC" : "Sunday",
	"ButtonD" : "Monday",
	"picarats" : 30,
	"originalpicarats" : 30,
	"puzzletitle" : "What Day is it?",
	"puzzletext" :"Even though we're constantly passing through time, sometimes it can be difficult to think about the way time flows. If yesterday's day after tomorrow is Sunday, what day is tomorrow's day before yesterday?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 2,
	"hintsgiven" : 0,
	"hint1text" : "Try using the Memo function to chart it out. It's a lot easier to think about if you use a visual reference.",
	"hint2text" : "Yesterday's day after tomorrow is Sunday, so what day is yesterday? Friday!",
	"hint3text" : "Tomorrow's day before yesterday is...? Yesterday! See how that works?",
	"hint4text" : "Hints Two and Three almost give the answer away. Since yesterday's day after tomorrow is Sunday, yesterday is Friday. Tomorrow's day before yesterday is yesterday. Do you remember what day yesterday is? You should be able to figure out the answer just fine now.",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""

}
var puzzle8 = {
	"ButtonA" : "Friday",
	"ButtonB" : "Saturday",
	"ButtonC" : "Sunday",
	"ButtonD" : "Monday",
	"picarats" : 50,
	"originalpicarats" : 50,
	"puzzletitle" : "What Day is it? 2",
	"puzzletext" :"Even though we're constantly passing through time, sometimes it can be difficult to think about the way time flows. If yesterday's day after tomorrow is Sunday, what day is tomorrow's day before yesterday?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 2,
	"hint1text" : "Don't get confused by the big numbers. Try to break it down into a familiar quantity. For example, if seven days after 14 days ago is Wednesday, what day is today?",
	"hint2text" : "Seven days after 70 days ago is the same day as nine weeks ago. If that day was a Sunday, what day is today?",
	"hint3text" : "Seven days before 70 days from now is the same day of the week as seven days after 70 days ago. If today is Sunday, all this puzzle is asking you is what day of the week it will be nine weeks from today. Pretty simple, eh?",
	"hint4text" : "If you know what day of the week it is, you'll always know what day is X weeks before or X weeks after because it will always be the same day!",
	"hintsgiven" : 0,
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle9 = {
	"puzzlelength" : 1,
	"picarats" : 65,
	"originalpicarats" : 65,
	"puzzletitle" : "Back and Forth",
	"puzzletext" :"The travelers are an hour away from their destination. Twelve people are divided into two cars (that each seat six people), but one of the cars just broke down, leaving only one vehicle for the rest of the trip. Using just the one car to drive back and forth, how many hours will it take to get everyone to the destination?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "The car seats six people, so after one hour the first six people arrive at the destination. Once five are dropped off, however, somebody has to drive the car back to pick up everyone else.",
	"hint2text" : "It takes two hours to drop off the first five people and drive back to get another load of passengers. There are six people still waiting, so the driver will load up as many as possible before heading back...",
	"hint3text" : "When picking up the second round of passengers, can you load up all six people who are waiting? Don't forget about the driver...",
	"hint4text" : "After dropping off the second load of five people, it's taken three hours and somebody still needs to drive back and get the last person waiting. It takes one hour each way, so you should be able to figure out the final answer by now.",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzle10 = {
	"puzzlelength" : 1,
	"picarats" : 50,
	"originalpicarats" : 50,
	"puzzletitle" : "Cookie conundrum",
	"puzzletext" :"There are 15 cookies to share amongst a large group. The first person eats one cookie then passes two equal portions of the leftover cookies to two other people. They both eat a cookie then each pass two equal portions of their remaining cookies to two other people, and so on until all of the cookies are gone. It takes one minute to eat a cookie. Ignoring the time that it takes to pass them, what's the shortest amount of time it could take for all of the cookies to be eaten?",
	"answeredcorrectly" : false,
	"incorrectguesses" : 0,
	"puzzletype" : 0,
	"hintsgiven" : 0,
	"hint1text" : "Visualizing exactly what the puzzle is describing as a scene in your mind might be all you need to figure this one out.",
	"hint2text" : "Try and break the problem down into numbers. If one out of 15 cookies is eaten, that means 14 are left. If you divide those 14 in half and pass them to two people, they each get seven. That's taken one minute so far. If you think about that problem in concrete mathematical terms like this, you should be able to figure it out.",
	"hint3text" : "The two people who get seven cookies each eat one cookie, which takes one minute. They both have six cookies left and divide those in half, then pass three cookies to two people each. That's two minutes so far.",
	"hint4text" : "The people who receive three cookies each eat one of them, so they each have two remaining. That's three minutes elapsed at this point. If you divide these two cookies in half and pass one cookie to each of the next people in line, how many more minutes will it take to finish the cookies?",
	"needspunishment" : false,
	"maxedpunishment" : false,
	"puzzlepicture" : ""
}
var puzzles=[
	puzzle1,
	puzzle2,
	puzzle3,
	puzzle4,
	puzzle5,
	puzzle6,
	puzzle7,
	puzzle8,
	puzzle9,
	puzzle10
	]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
