From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 11:41:47 -0400
Message-ID: <e692861c0608290841u725e60dfl32ce79b29e53156f@mail.gmail.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
	 <44F322A6.9020200@namesys.com>
	 <20060828173721.GA11332@hello-penguin.com>
	 <44F332D6.6040209@namesys.com>
	 <1156801705.2969.6.camel@nigel.suspend2.net>
	 <20060829045937.GA9181@localhost.hsdv.com>
	 <op.te1sixuycigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.te1sixuycigqcu@apollo13>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: PFC <lists@peufeu.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On 8/29/06, PFC <lists@peufeu.com> wrote:
>         Anyone has a bench for lzf ?

This is on a opteron 1.8GHz box. Everything tested hot cache.

Testing on a fairly repetative but real test case (an SQL dump of one
of the Wikipedia tables):
-rw-rw-r-- 1 gmaxwell gmaxwell 426162134 Jul 20 06:54 ../page.sql

$time lzop -c ../page.sql > page.sql.lzo
real    0m8.618s
user    0m7.800s
sys     0m0.808s

$time lzop -9c ../page.sql > page.sql.lzo-9
real    4m45.299s
user    4m44.474s
sys     0m0.712s

$time gzip -1 -c ../page.sql > page.sql.gz
real    0m19.292s
user    0m18.545s
sys     0m0.748s

$time lzop -d -c ./page.sql.lzo > /dev/null
real    0m3.061s
user    0m2.836s
sys     0m0.224s

$time gzip -dc page.sql.gz >/dev/null
real    0m7.199s
user    0m7.020s
sys     0m0.176s

$time ./lzf -d  < page.sql.lzf > /dev/null
real    0m2.398s
user    0m2.224s
sys     0m0.172s

-rw-rw-r-- 1 gmaxwell gmaxwell 193853815 Aug 29 10:59 page.sql.gz
-rw-rw-r-- 1 gmaxwell gmaxwell 243497298 Aug 29 10:47 page.sql.lzf
-rw-rw-r-- 1 gmaxwell gmaxwell 259986955 Jul 20 06:54 page.sql.lzo
-rw-rw-r-- 1 gmaxwell gmaxwell 204930904 Jul 20 06:54 page.sql.lzo-9

(decompression of the differing lzo levels is the same speed)

None of them really decompress fast enough to keep up with the disks
in this system, lzf or lzo wouldn't be a big loss. (Bonnie scores:
floodlamp,64G,,,246163,52,145536,35,,,365198,42,781.2,2,16,4540,69,+++++,+++,2454,31,4807,76,+++++,+++,2027,36)
