From: Humberto Massa <humberto.massa@almg.gov.br>
Subject: Re: reiser4 non-free?
Date: Thu, 06 May 2004 16:56:23 -0300
Message-ID: <409A9867.7040105@almg.gov.br>
References: <pHiWpB.A.zfD.ypomAB@murphy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pHiWpB.A.zfD.ypomAB@murphy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com, Richard Stallman <rms@gnu.org>

@ 06/05/2004 15:56 : wrote Hans Reiser :

> I don't think my clarifications of what is a derivative work conflicted
>with the GPL, they merely make it less vague as to what is a derivative 
>work.  The notion that if something is linked determines whether it is 
>derivative has no basis in either copyright law or the GPL.  rms, 
>correct me if you disagree.
>  
>
In Brazilian copyright law, a derivative work has a simple definition: 
the work achieved by some transformation of the original work, but is a 
novel intellectual creation in itself.

Even the GPL is excessively verbose about what a derivative work is, and 
some of it contradicts the various copyright laws in a lot of 
jurisdictions. What I'm trying to say is: please don't. Solve the 
credits problem in any other way. I would be glad to help you. I care. 
Really.

>Vagueness is not a benefit to a license, but in this aspect of the GPL 
>it is curable only in specific to a particular program being licensed.  
>It would be nice if the GPL explicitly allowed particular instances of 
>it to specify what are derivative works with some clarity.  (Richard, 
>please consider that.....)
>  
>
But, it currently does not. It currently (and, in the case of the linux 
kernel, forever -- the linux kernel is licensed by GPL V2 only, not 
later) forbids aditional restrictions. It already places some 
restrictions, even on what is to be considered a derived work, which is 
a little bit out of its reach. If your work is a derived work (and I'm 
assuming reiser4, for instance, is a derived work of the linux kernel), 
Debian could only distribute it if it's licensed under the GPL V2 -- and 
no aditional restrictions, as per the GPL text itself.

Here is the text of the GPL, section 6, with my coments between {{}}:
*6.* Each time you redistribute the Program (or {{ in this case, reiser4 
}} any work based on the Program {{ linux }} ), the recipient 
automatically receives a license from the original licensor to copy, 
distribute or modify the Program subject to these terms and conditions. 
{{ important part: }} You may not impose any further restrictions on the 
recipients' exercise of the rights granted herein {{ which include, for 
example, moving printf-credits to some-file-credits }}. You are not 
responsible for enforcing compliance by third parties to this License.

>I can see that not very clever people who view the GPL as some sort of 
>holy writ will make more of an issue out of it than I want to deal 
>with.  So, as a result reiser4 plugins will always be compiled in and 
>never dynamically loadable and the clarifications of what is or is not a
>derivative work have been removed for now.  Users and I will both lose 
>as a result, and maybe some needless lawsuit will result at some time in
>the future that would have been avoided with clear definitions.
>  
>
This seems to be unnecessary: in this case, specifically, if reiser4 
plugins were or not derived works of reiser4, is settled even without 
the clarifications -- they are. Rule of thumb to derived works: could 
them (plugins) be created (as they are, not in a different way) if the 
original work (reiser4) was not created? Yes = derived; no = original. 
Likewise, could reiser4 be created as it is now, had linux not been 
created? Yes = reiser4 is a derived work on linux; no = it's an original 
work.

It's the same case as Windows NDIS drivers loading on linux. They were 
created in a different environment, and would exist as they are even if 
linux did not exist. Provided GPL'd glue code, you can load them in the 
linux kernel, and they are _not_ derivative works. This wouldn't happen 
with reiser4 plugins... unless, of course, someone took, for instance, 
NTFS plugins (if those ever come to existence) and put some (GPL'd) glue 
code to load them as reiser4 plugins (this would not render the 
previously-non-derived NTFS plugins in derived code from reiser4.)

>Hans
>  
>
I renew my plea for a peaceful and consensual resolution of these 
matters. Thank you, and please keep up the good work in the filesystems.

-- 
best regards,
Humberto Massa

