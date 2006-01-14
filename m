From: David Masover <ninja@slaphack.com>
Subject: Re: Authoring a versioning plugin
Date: Sat, 14 Jan 2006 11:28:51 -0600
Message-ID: <43C934D3.7040406@slaphack.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <43C80EC3.7050003@namesys.com> <Pine.LNX.4.64.0601131758210.8337@gentoo.grakker.jesnetplus.com> <200601140107.49814.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601140107.49814.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: Jonathan Sailor <jsailor@jesnetplus.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>

Peter van Hardenberg wrote:
> On January 13, 2006 03:00 pm, you wrote:
> 
>>On Fri, 13 Jan 2006, Hans Reiser wrote:
>>
>>>If someone figures out why we can't do it but /proc can, or even fixes
>>>it, it would be good.
>>
>>It wouldn't be something so simple as echo's trailing newline, would it?
>>
>>-Jonathan
> 
> 
> Good thought, but no:
[...]
> norbs@cortana:/home/norbs/reiser/emptydir/..../plugin$ echo "ext-1" -n > 
> fibration
[...]
> norbs@cortana:/home/norbs/reiser/emptydir/..../plugin$ irb
> irb(main):004:0> f = open('fibration', 'w')
> => #<File:fibration>
> irb(main):005:0> f.write('ext-1')
> => 5
> irb(main):006:0> f.close
> => nil
> irb(main):007:0> exit
[...]
> I'd look more closely at how proc does it and how we do it, but I'm too tired 
> for source digging tonight.

I think the difference is that Reiser expects a null-terminated string,
whereas Proc doesn't need the null, and can chop off newlines when needed.

So, I think this would also work:

echo -en 'ext-1\0' > fibration

