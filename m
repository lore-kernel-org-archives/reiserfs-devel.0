From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 non-free?
Date: Fri, 07 May 2004 09:14:06 -0700
Message-ID: <409BB5CE.3020805@namesys.com>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org> <4099A868.9030406@slaphack.com> <20040506.083242.41632888.wlandry@ucsd.edu> <87k6zpy8ke.fsf@aule.evenmere.org> <20040506143643.GB25505@raptus.homelinux.org> <877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com> <20040506232310.GA25081@hezmatt.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040506232310.GA25081@hezmatt.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Palmer <mpalmer@hezmatt.org>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Matthew Palmer wrote:

>
> Do you really want
>N+1 distributions all e-mailing you for every release with their credits
>questions?
>  
>
Yes.  Not such a burden, much less than explaining that write caching is 
badly done in most linux distros and kernels.

>You could go GFDL and define the exact wording of your desired credits in
>the licence, but then it would involve a licence change to change the
>credits -- which if you've got parts licenced by different people under a
>particular form of credits in the work, will require a new licence grant by
>them, unless you word the licence in such a way that new credits can be
>added to the licence without mucking up old ones.
>  
>
Oh, I always get full rights to licensing ReiserFS stuff routinely.  
Remember, I sell proprietary licenses once every year or two that pay 
the bills for a year.

>  
>
>>Q: Can we the distro preserve the credits but send the credits to /dev/null.
>>
>>A: No. How can you even ask such a question?
>>    
>>
>
>Q: Can we the distro send the credits to another virtual console other than
>the one the user is currently looking at?
>
>Likely Answer: No.  How can you even ask such a question?
>
>Actual answer: ???
>
>Q: Must we then force the user to stay on the virtual console which the
>credits are displayed until the notice has finished displaying?
>
>Likely Answer: No.
>
>Actual Answer: ???
>  
>
the current credits do not prevent console switching, though they do 
print to the one the user interacted with when he caused the mkreiserfs 
to occur.  why would you want to change that?

>Q: Where is the limit between displaying the credits where the user won't
>necessarily see them, and forcing the user to read them?
>
>Likely Answer: Umm...
>
>Actual Answer: ???
>  
>
Display the credits at the same times that running the tool without the 
wrapper would display them, and the license is satisfied.  If you want 
to improve the credit presentation, involve the author in it. If you 
don't like the excessive credits, use other software.   I dislike Disney 
dvds because they don't let me fast forward past the disney castle, but 
my kids and I like their movies (especially the old ones) more than I 
hate their credits so I survive ok....

>These are all "line in the sand" questions which need to be answered.  If
>distros are desiring to re-brand you (or rather, your contibutors) out of
>the equation, they will likely be looking for where the line is, and how far
>they can redraw it in their favour while you're not looking.  I'd imagine
>that if you don't embed the line in concrete and bolt it down, it'll end up
>somewhere you don't expect.  So you really have to tighten up your wording.
>
>I'm not against what you're trying to accomplish - I like to be attributed
>for my work, too.  I've never noticed any instances where I've not been
>properly attributed in my work on an OSS project, and in fact I've been
>surprised several times by the prominence others have given my name for work
>I have done.
>  
>
The persons I put in the credits didn't ask for it.  The distros are 
however stripping out the credits for various projects, and unless they 
are stopped this will accellerate.

>I've relied on human kindness thus far, and it's worked pretty well for me,
>so perhaps my naivete is showing a little... That being said, as far as I
>know my work doesn't form a fairly important part of *any* distribution
>(Debian or otherwise).
>
>There's something I haven't seen answered in this thread or the other
>recurring ones on the same topic: have you ever actually made a formal
>request to any of the distributions which have butchered your credits to
>reinstate them?  If so, what was the response?
>
I did not make a formal request first before changing the license.  
Maybe you have a point there.  I was pretty pissed when they removed the 
credits without even mentioning that they had done so....  You see, that 
is part of the problem.  I won't know about all the times the credits 
get removed if it is not in the license.....  but you are right that I 
missed the chance to see if the top level of the distros could be talked 
out of their actions.

>  If not, why not, especially
>since you advocate distributors asking authors what is appropriate?
>  
>

