From: Hans Reiser <reiser@namesys.com>
Subject: Re: Debian: reiser4 non-DFSG-free. !?!
Date: Thu, 06 May 2004 12:26:05 -0700
Message-ID: <409A914D.1020301@namesys.com>
References: <kkKLVD.A.2NF.qPomAB@murphy> <409A90A5.30600@almg.gov.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409A90A5.30600@almg.gov.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Humberto Massa <humberto.massa@almg.gov.br>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Another example:

reiser@linux:~/reiser4progs-0.5.3> /sbin/mkreiserfs -V
mkreiserfs 3.6.9 (2003 www.namesys.com)

A pair of credits:
Edward Shushkin wrote the encryption and compression  file plugins,  and 
the V3
journal relocation code.

Vladimir Demidov wrote the parser for sys_reiser4(), the V3 alpha port, 
part of
the V3  journal  relocation code,  and helped  Hans keep  the business  
side of
things running.



Humberto Massa wrote:

> @ 06/05/2004 15:29 : wrote Hans Reiser :
>
>> I just modified the Reiser4 license to be the following:
>>
>> The Anti-Plagiarism License
>>  
>>
> etc.
>
> Mr. Heiser,
>
> I am a software developer, a paralegal, and a Debian user. Recently, 
> I've participated in various technical discussions in debian-devel and 
> in various licensing discussions in -legal. While I have sent you, 
> both by way of the lists and personally, some questions about the 
> reasoning of your licenses, you have up to the present moment 
> refrained to answer me.
>
> I stated in those e-mails that I am a great admirer of your work. I 
> stated, also, that I agree with your concerns about plagiarism. I 
> said, moreover, that I think that your work and the other reiser[34] 
> contributors' work is important. Important to Debian. Important to the 
> Linux community. Important to the Linux users. It's certainly 
> important to me.
>
> What I don't understand is _why_ are you doing this in such a 
> beligerant manner. I repeat: please, let's work our differences out. 
> Let us reach consensus and move forward.
>
> Reading all the lists archives and bug reports, it appears to me that 
> (at least part of) the problem is the following: some of your 
> filesystem utilities displayed, unconditionally, a big (by some 
> measure, but greater than 3 lines) attribution of credits. This was 
> too much to some package maintainers, and they transferred said text 
> to a file in the documentation directory for the package. You filed a 
> bug, the maintainer gave you the shoulder, flames ensued, etc.
>
> I don't agree with you that this is plagiarism. I'm sorry to say, but, 
> in my dictionary (and in the jurisdiction I live in) plagiarism would 
> be, for instance, remove *all* the credit attributions in the 
> packages, or substituting them for some credits crediting the wrong 
> person or persons. In this case, here in Brasil at least, the person 
> commiting such acts would be subject to one to four years in jail and 
> a fine.
>
> The legal part of this remembers me of another problem, with your old 
> "clarifications" over the GPL and with your new Anti-Plagiarism 
> License: it's a GPL-incompatible license ... for a work (reiser4) 
> which is derived from a GPL'd work (linux).
>
> This pretty much renders your product (reiser4) undistributable by any 
> person other than yourself. And, in principle, even by yourself. And I 
> think this is a very big loss.
>
> About the credits: if the credits attribution is too long to fit by 
> the standards of the package's maintainer (who is the proper authority 
> in the case, seemingly), what other solution there is? Just putting a 
> line like:
>
> "Many people contributed to this project. Please look: 
> /usr/share/doc/reiserfsprogs/CREDITS."
>
> is not enough? I mean, instead of the 20+ lines of the current display 
> in dispute? As someone noticed in debian-legal, many people leave the 
> theather before the credits roll. They know it's a (for instance) 
> George Lucas' movie, but they won't know the name of the cameramen. 
> Isn't it the same thing? If you want to see the credits, go and see 
> them. It's not like Debian did make them disappear.
>
> Now, I have only one question: is there a way you could back out in 
> your opinion and return to the old licensing for your products, 
> provided a consensus on moment and size of the credits attribution is 
> reached? If the answer is yes, I volunteer to mediate the discussions 
> between you and the affected package(s) maintainer(s).
>
Try running mkreiserfs and seeing if it really is all that bad, ok?

Thanks for caring.

Hans
