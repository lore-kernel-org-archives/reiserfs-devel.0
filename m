From: Harald Radke <harryrat@gmx.de>
Subject: Re: resize_reiserfs probs
Date: Tue, 24 Jun 2003 00:12:39 +0200
Message-ID: <200306240012.39596.harryrat@gmx.de>
References: <200306230132.08812.harryrat@gmx.de> <200306230902.05070.harryrat@gmx.de> <3EF6DD1A.5040802@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF6DD1A.5040802@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

Am Montag, 23. Juni 2003 12:57 schrieben Sie:

> > -> resize_reiserfs -s -9200M /dev/hda3
> > (for "testing" purposes"....same prob)
>
> Your command doesn't resize to 9200M, it makes the fs 9200M SMALLER. Of
> course that is going to fail. Please try
>
> resize_reiserfs -s 9240720K /dev/hda3
> or
> resize_reiserfs -s 9200M /dev/hda3
>
> and you should be fine. The minus sign is the key to your problem.
>
yeah, now it worked ((: thx!

hm, no offense but maybe the manpage text should be a little clearer in this 
respect...like not saying 

"-s [+|-]size   Set the new size in bytes"

but 

e.g. 
"-s [+]-] value     increases (+) / decreases (-) filesystem size by value"

and/or maybe use better values in the shrinking example so that it is quite 
clear that u have to specify the amount by which size is changed and not the 
new size (:


anyways, thx for ur really fast help, now my thinkpad can hibernate ((;


Greez,
		Harry
