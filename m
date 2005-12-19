From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Reiser4 Plugin Developer Wiki
Date: Mon, 19 Dec 2005 13:33:14 -0800
Message-ID: <200512191333.14369.pvh@uvic.ca>
References: <27c2ef000512182326j686d7e1fic28fbeb511c769b7@mail.gmail.com>
 <43A71A86.2090306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <43A71A86.2090306@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On December 19, 2005 12:39 pm, Hans Reiser wrote:
> I am sorry that this turned out to be more work than your budget allowed
> for, and I also regret that I think there was some deeper disagreement
> over the appropriate fundamental semantics, as the discussion with Peter
> Foldiak and I revealed.
>
> Hans

Eh, we weren't being paid and we didn't have a customer, so we'll be alright 
in that regard. Still, I think the issue of user-defined attributes vs. 
file-as-dir still needs more work and I look forward to extending the debate 
some time.

Let us assume that I am wrong about keeping attributes in a separate @ 
directory and continue from there. Perhaps after the "resource fork" 
implementation is complete the case for more options might be clearer.

So, let us find a way to store standard files within files, as we can all 
agree on that!

$ ./myScript
Running myScript...
$ cd myScript; ls;
internal
file
contents
$

Our existing research is still very much valid, but I don't think a 
pseudo-plugin is the way to implement this. Perhaps the best way to handle 
the issue would be to write a new directory plugin?

Hans, I remember you described how you thought it would work in a sentence or 
two. Could you perhaps flesh out the idea to a paragraph or three? With that 
much guidance, I think we could go further without feeling like we are 
wasting effort.

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
