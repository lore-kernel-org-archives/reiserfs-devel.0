From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: resize_reiserfs probs
Date: Mon, 23 Jun 2003 12:57:30 +0200
Message-ID: <3EF6DD1A.5040802@gmx.net>
References: <200306230132.08812.harryrat@gmx.de> <3EF69F09.90404@gmx.net> <200306230902.05070.harryrat@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306230902.05070.harryrat@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Harald Radke <harryrat@gmx.de>
Cc: reiserfs-list@namesys.com

Harald Radke wrote:
> Good morning all!
> 
> 
>>>"resize_reiserfs: can't shrink fs; too many blocks already allocated"
>>>[...]
> 
> 
>>I know this one very well. Please tell us the exact (including spaces)
>>command line you were using to resize it. I suspect user error here - at
>>least it was one when I got this error.
> 
> 
> the command was 
> 
> -> resize_reiserfs -s -9240720K /dev/hda3
> 
> I also tried
> 
> -> resize_reiserfs -s -9200M /dev/hda3
> (for "testing" purposes"....same prob)

Your command doesn't resize to 9200M, it makes the fs 9200M SMALLER. Of
course that is going to fail. Please try

resize_reiserfs -s 9240720K /dev/hda3
or
resize_reiserfs -s 9200M /dev/hda3

and you should be fine. The minus sign is the key to your problem.

HTH,
Carl-Daniel
-- 
http://www.hailfinger.org/

