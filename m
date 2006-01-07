From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Sat, 7 Jan 2006 15:03:29 +0100
Message-ID: <20060107140329.B6E4112B4@philou.gramoulle.local>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com>
	<13dbb67f0601070441q559b156ep@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <13dbb67f0601070441q559b156ep@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Sat, 7 Jan 2006 13:41:50 +0100
Andrea Gelmini <dislessico@gmail.com> wrote:

  | 2006/1/6, Robert Hulme <rob@robhulme.com>:
  | >
  | > http://linuxgazette.net/122/TWDT.html#piszcz
  | >
  | > It seems to come off fairly badly in most of the tests.
  | 
  | 
  | I really did not understand  this kind of benchmark. I don't care which
  | filesystem is faster creating 10.000 files (something I never have to do). I
  | care about which filesystem fits better with my everyday use of my data.

Well, i do care about which filesystem is faster creating 10.000 files : I happened
recently to author a DVD under Linux using mplayer. For creating some menus,
i had to (well mplayer had to) dump an mpeg file into jpegs , creating about
6000 pictures ( 4 titles with about 1500 pictures for each) (and deleting them
afterwards of course)

I do expect Reiser4 to be faster in the long run for such operations (large
creates/deletes) even if that's not the case right now.

I'm rather disappointed by the feeling this benchmark will give the average users :
Reiser4 is either dog slow or far for being ready for prime time.

Still, as Hans said, i think that some valuable things can be learnt from this benchmark
and it will be good if this benchmark could be carefully reproduced by Namesys and other
Reiserfs enthusiasts

Thanks,

philippe
