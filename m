From: Christian Stroetmann OntoLab <stroetmann@ontolab.com>
Subject: Re: reiser4 inclusion?
Date: Sat, 25 Apr 2009 22:15:10 +0200
Message-ID: <49F36F4E.3000906@ontolab.com>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de>	 <49EB1E3F.1020905@gmail.com>	 <542E227E-E31D-496C-93FB-19393133297F@MailNewsRSS.com>	 <200904250153.33258.volkerarmin@googlemail.com>	 <2E9381E6-A09A-4330-9A61-C4B7D7CE0E71@MailNewsRSS.com>	 <49F2CF9A.1060202@inn.nl> <49F2D43F.90105@ontolab.com>	 <8c113a260904250416n28fbdacs682ef8e6859b7dbf@mail.gmail.com>	 <49F339A2.9080705@ontolab.com> <8c113a260904251204u41f90028n975006634ed99e59@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <8c113a260904251204u41f90028n975006634ed99e59@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alli Quaknaa <alquaknaa@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Dear Alli,
> Well, as you noted at the end of your reply, it is polite to reply to
> answers. Maybe you can be the one to start.
>   
What am I doing since months?
> On Sat, Apr 25, 2009 at 6:26 PM, Christian Stroetmann OntoLab
> <stroetmann@ontolab.com> wrote:
>   
>> Hello Alli,:
>>     
>>> Hello,
>>> I don't know the background of OntoLabs
>>>       
>> OntoLab. There can only be one. ;)
>>     
>>>  and even when I googled and
>>> read something in teh archives, I haven't learned much. I would like
>>> to ask a few questions.
>>> 1. @Christian: have you done any actual development
>>>       
>> I did a further development, which is based on R4 but transforms it to
>> something different/new. Besides some other issue this new storage system
>> was given a new name, a process which is common in the open source area
>> (examples can be given on request).
>>     
> It is common to give it a completly different name in case there are
> some legal issues, for example Gaim -> Pidgin (AIM legal problem).
Okay
>  It
> is common to give a name back-referencing the original project you are
> forking, for example Go-OO (enhanced OpenOffice.org which tries to
> cooperate with the original project).
Okay
>  But I'm sure that you can give
> examples of forks that chose distinct names to tell the two projects
> apart (Mambo - Joomla).
Is it a typo: Can give or can't give?
>  I would not say that one or another custom is
> more common.
>   
I don't understand this remark. All your possibilies you enumerated does 
say the same: It is common for a reason to give something a new name. 
And my for simplicity of discussion not named real examples are a 
database named X as the foundation and the same database with 
transaction enhancement but named Y. Than the same database X and 
another version of this database with other goodies now named Z. A one 
liner on the websites of Y and Z, which is referencing database X, and 
ready. A real world example (I can look after the real names in my 
archive, if you really need to know them).
>>>  or have you just
>>> renamed the filesystem, created a webpage with feature highlight and
>>> gave no credit to original developers except for NOT explicitly
>>> renaming the files you are mirroring? In the text there is no mention
>>> of Reiser4 even though it in fact is Reiser4. Why?
>>>
>>>       
>> See above. And it was discussed in mailing-lists to rename it due to a
>> special issue around a person, which let all main sponsors to jump of the
>> bandwagon. In this respect the new name was also meant to restore again the
>> acceptance for the foundational filesystem.
>>     
> I think that the "special issue" is not exactly what caused somebody
> to leave;
The reaction to leave were a more than clear answer.
>  I still use reiser4 simply because it is a very good
> filesystem.
Yes, okay. But the opinions in this case were 50 to 50. You say, that 
you belong to the group of persons, who are interested in the 
filesystem. I belong to the other group, and for us the context and the 
persons around a project are important concerns. Only a short reminder: 
The "special issue" was not stealing some candies.
>  Also, you didn't say what development other then renaming
> and setting up a webpage and stuff have you done.
Sorry, but this is wrong. I do understand that my project is highly 
complex, but experts understand directly the genius solution, eg. 
universities in Germany have arranged the education in Computer Sciences 
around nearly all of the mentioned themes/items on the OntoLinux 
webpage. I think it will take 10 to 15 years to see for persons not 
deeply involved in these areas of Informatics how elegant and 
progressive my development really is.
>  Sure, you can say it
> because you didn't want someone to steal from you. But THAT is
> definitely not a common opensource process.
Yes, because it is not a common solution.
>  And there is no original
> code I could download from you.
>   
Yes, but only until it is better known and accepted. After these the bad 
guys can't steal anymore.
>>> 2. @Christian: What did you have in mind when you set the page up?
>>>
>>>       
>> See above. And at that time there was no project page for R4. As I mentioned
>> also this happened before the source code was archieved at kernel.org.
>>     
> Before reiser4 patches were available from kernel.org they were
> available from namesys.
Yes, as long as the company namesys was running.
>  Then there was time when it was available from
> both sources and then namesys went down.
No, AFAIK that is wrong.
>  So you set this up at the
> time when namesys webpage (and company) was still functional? This
> makes me wonder even more why would you set up your own page when
> there was a company developing the filesystem.
>   
Please see above.
>>> What features were you going to work on if Edward cooperated with you
>>>
>>>       
>> It's over. I only take part in the discussion, because I would like other
>> people to know my motivations.
>>     
> Well, that might be why I put in the past tense. So please answer me,
> what features were you going to work on?
>   
General functionality and common development, the hardlink problem 
(which is after Al Viro one of the NO MAINLINE FOR REISER4 problems), a 
potential solution for the cyclic dependance problem, some ideas for the 
plug-in architecture problem (which is also a NO MAINLINE FOR REISER4 
problem), the described Semantic (World Wide) Web transformation, and 
much more.
>>> (as you say he refused to; I don't know the history so please excuse
>>> me everybody)?
>>>       
>> In another thread I publicated the e-mail, which was sent by me to the
>> maintainer. I got no answer until today. Than Jason asked for the actual
>> maintainer and mentioned that he also send an e-mail. Later we found out
>> that a maintainer for R4 really exists.
>>     
>>>  For instance there are three things I'm missing in
>>> reiser4: defragmentation tool, resize tool, xattrs. I haven't learned
>>> from the text what YOU wanted to work on.
>>>
>>>       
>> Yes, I described it only so far, that the open source community has no
>> problems with patents by the large companies. The details of my work are
>> described between the lines. I'm sorry for not giving all details or a
>> better description, but there are some really bad guys in th IT-circus
>> running around.
>>     
> I really don't know about any other project that would use this
> process and it looks cheesy.
Sorry, that is a personal problem. See also above.
>  And I don't know about patents,
Sorry, but you don't have insight into this technological area. If I 
tell you that the situation is like I say, than you should trust me.
>  for
> example the btrfs filesystem is implementing a lot of features used in
> commercial filesystems and they don't seem to have any problems.
Oh, please, there are many reasons for this, eg. old patents, no 
patents, open source, bought patents by the opensource community, and so 
on. To your btrfs example: I'm sure that Oracle has thoroughly looked at 
potential patent problems.
>  So
> could you please be more specific, either in explaining the features
> or the reasons why you don't want to/can't publush them?
>   
See above. I do know who is taking everything from other projects and is 
using it for its business without referencing the sources (no names will 
be given here).
>>> 3. Everybody else: Could you please point me somewhere I can read
>>> about this whole history?
>>>       
>> The history of R4 or this special thread?
>>     
> The history of reiser4, you, OntoLab. I just want a link to where this
> problem started.
>   
The history, todo-lists, manuals, helping documents, and the other items 
of R4 are scattered in the internet. I wanted to collect them on the 
proposed project page.
My opinions are given in this mailing-list.
OntoLab is the name of the laboratory. The project is named OntoLinux. 
The storage system can be found in the Components section. Also, you 
must be at least familiar to the bare bone with everything linked in the 
Software and Hardware lists.
>>>  I believe that Edward and others have good
>>> reasons to act the way they do (and I think they have the full right
>>> to), but I would really like to read on this.
>>>
>>>       
>> No, I have the opinion that R4 is a GPL'ed code and that the open source
>> development community, especially around Linux, has established some other
>> kinds of "rules" to work together. One of this rule is to answer questions
>> or to say her/his opinion directly to someone else. But this is in fact one
>> of the points in discussion too.
>>     
> Sure. But from what I've seen it looks like they did in the past and
> don't consider it necessary now, because repeating the same thing over
> again would be a waste of time. That's why I want to read the first
> mails about this.
>   
Have fun searching, finding, reading, and understanding. It took me some 
portions of precious time.
>>> Hope I didn't offended anybody and BTW it would actually help to have
>>> a stable hosting for wiki/trac or something that like system and a
>>> centralized place for the tools, it's manuals, some howtos, roadmap,
>>> todo and this kind of stuff. kernel.org is not exactly the best place
>>> for this AFAIK. Just my two cents.
>>>
>>>       
>> Yes, that is exactly the point. And there are so many other unsolved items.
>> Last but not least I do repeat a question a nice person asked me: How want
>> one developer alone manage the code? (It doesn't matter if there are in
>> reality 5 or 10 developers.)
>>     
> I was talking about setting a project page.
Please, read the mailing-list first.
>  You were setting up a
> project page in a context of a completely different company (probably
> owned by you) with a different name, with no useful information on
> future development (just a load of "it will be great" text). There is
> a difference between the two.
>   
Please, read the mailing-list first. All different versions were proposed.
And I really do apologize for repeating, but: We are running in circles 
since 2 or 3 years. :-D
> Have a nice day,
> al-Quaknaa
>   
Have fun
Christian *<:o)
