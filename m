From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Mongo error while building HTML results
Date: Tue, 17 Aug 2004 13:03:49 +0200
Message-ID: <20040817130349.0a4b95a4@philou.gramoulle.local>
References: <20040806152923.4a4eedc7@philou.gramoulle.local>
	<20040808063358.GE9811@backtop.namesys.com>
	<20040808151456.7765b337@philou.gramoulle.local>
	<20040814143718.GH13834@backtop.namesys.com>
	<20040815022406.01ca4cf7@philou.gramoulle.local>
	<20040817053053.GL4703@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040817053053.GL4703@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com


Hello Alex,

On Tue, 17 Aug 2004 09:30:54 +0400
Alex Zarochentsev <zam@namesys.com> wrote:

  | > No problem with mongo-2004.07.26.tar.gz though.
  | Actually, 2004.07.24.tar.gz has the same bug, update-flist.pl was missing.
  | the "copy" phase did not work if phase_copy=cp.
  | 
  | Please try 
  | http://thebsh.namesys.com/benchmarks/dist/mongo-2004.08.17.tar.gz

Great ! it's working fine now :)

Updated Mongo results can be found here (somewhat old snapshot though):

http://philou.org/linux/reiser4/mongo/mongo.html

The mongo log files are here:

http://philou.org/linux/reiser4/mongo/reiser4.log (new)
http://philou.org/linux/reiser4/mongo/reiser4-old.log (old)
http://philou.org/linux/reiser4/mongo/reiserfs.log
http://philou.org/linux/reiser4/mongo/ext3.log

and the kernel config file is here:

http://philou.org/linux/reiser4/mongo/config-2.6.8-rc2-mm2

For the record, i first wanted to mimic the benchmark from David (http://dabbs.net/reiser4/mongo.html),
but i remember Hans asking about 8K file size runs.

Could you provide me standard Mongo runs  that you would like me to try, because with so many parameters,
i'd like rather both not waste my CPU cycles with mongo runs you don't care about but instead report valuable feedback to you :)

Thanks,

Philippe
