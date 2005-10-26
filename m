From: Hans Reiser <reiser@namesys.com>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 14:09:06 -0700
Message-ID: <435FF072.7060905@namesys.com>
References: <200510251558.13860.pvh@uvic.ca>	 <87k6g1yp5a.fsf@evinrude.uhoreg.ca>	 <435F7A2A.5020506@st-andrews.ac.uk> <200510260910.12136.pvh@uvic.ca> <5c49b0ed0510261404i7a8db8e1hafe18d1bdd54130@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0510261404i7a8db8e1hafe18d1bdd54130@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nate Diller <nate.diller@gmail.com>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

Nate Diller wrote:

>On 10/26/05, Peter van Hardenberg <pvh@uvic.ca> wrote:
>  
>
>>On October 26, 2005 05:44 am, you wrote:
>>    
>>
>....
>  
>
>>Also: I still have not been able to USE files as directories. Yes, I can
>>reach
>>file/..../, but that is only one special case. I can crash things like it
>>was
>>going out of style by playing with these file-directories. Does nobody have
>>
>>any experience with this? What kind of work is it going to take me to get
>>this going?
>>
>>    
>>
>I do have some experience with this, with code about 9 months old now.
> There are two basic problems.  One is that the code has suffered
>bitrot over the past year, so it will have bugs compared to when I
>played with it.  The other problem is that it causes serious confusion
>to the Linux VFS, the dentry cache in particular, which has become
>increasingly complex in its efforts to stop sucking so bad.  It may be
>useable as a toy by fixing a few of the recent bugs I mentioned, but
>it will not be compatable with Linux until someone such as myself
>spends about a year working on it.  And even then, I bet it would not
>be merged for another year at least.
>
>The other way to do cool metadata stuff in Reiser4 is sys_reiser4(),
>which was in a serious state of not being useable last I tried it. 
>However, it's more likely work at some point, perhaps you can look
>into helping finish it off, although I expect it will involve lots of
>core reiser4 hacking.
>
>My verdict: file-as-dir is dead, and will not return to the world of
>the living in its current form
>
>NATE
>
>
>  
>



file-as-dir has bugs.  These bugs require substantial vfs fixes or vfs
sidestepping.  That will be done, but not right now, we have to get the
rest of the code into the kernel first, and then work on it.  I disagree
with Nate's characterization of things.

Hans
