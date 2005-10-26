From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 13:44:26 +0100
Message-ID: <435F7A2A.5020506@st-andrews.ac.uk>
References: <200510251558.13860.pvh@uvic.ca> <435EBB09.5030200@namesys.com>	<200510251704.56000.pvh@uvic.ca> <87k6g1yp5a.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87k6g1yp5a.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Hubert Chan wrote:

>On Tue, 25 Oct 2005 17:04:55 -0700, Peter van Hardenberg <pvh@uvic.ca> said:
>  
>
>>I envision creating a simple shell in a scripting language which will
>>operate on an XML representation of the filesystem which maps, in the
>>simple case, directories and files such that simple xpath queries
>>appear identical to normal filesystem queries.
>>    
>>
>
>Although it's not exactly the same, you may be interested in a research
>proposal that I wrote for a course last year on embedding XML databases
>into the filesystem namespace.  At least some of the references may be
>useful.
>
>http://www.cs.uwaterloo.ca/~hy3chan/cs741project.ps
>
Also take a look at the part of a (record-breakingly long?) thread "file 
as a directory" on this list (also copied to lkml) near and after:

http://www.ussg.iu.edu/hypermail/linux/kernel/0411.3/0044.html

There, I suggested that file selection should be unified with 
part-of-file selection using XPath-like syntax.

To do what you are suggesting efficiently would be really nice. To do it 
inefficiently (with a shell script) may still be interesting, possibly 
even useful. But as XPath was originally inteded for selection inside 
XML files, it would also be nice if (at least for your XML files) you 
could select inside your files using a unified syntax!
 Peter
