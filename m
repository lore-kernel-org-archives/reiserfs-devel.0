From: "Willi W." <willi.w@gmx.at>
Subject: Re: Application Problems with Reiser4/19.01.2004-fixed (truncated)
Date: Mon, 26 Jan 2004 16:46:01 +0100
Message-ID: <40153639.6080609@gmx.at>
References: <4010218C.9090006@gmx.at>	<16400.65481.167302.617050@laputa.namesys.com>	<40110710.4070100@gmx.at> <16401.3844.21706.388236@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16401.3844.21706.388236@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

>Hmm... can you run overnet under strace (up to the failure) and send the
>output to me?

--

all files in the ./temp directory should be reloaded at startup.

access to the directory in the strace output:

--

      --
      [pid 21379] <... write resumed> )       = 1
      [pid 21381] stat64("/mnt/reiser4/overtest/temp",  <unfinished ...>
      [pid 21379] write(0, "n", 1n <unfinished ...>
      [pid 21381] <... stat64 resumed> {st_mode=S_IFDIR|S_ISVTX|0755,
      st_size=3, ...}) = 0
      [pid 21379] <... write resumed> )       = 1
      [pid 21381] open("/mnt/reiser4/overtest/share.dat", O_RDONLY
      <unfinished ...>
      [pid 21379] write(0, "e", 1e <unfinished ...>
      [pid 21381] <... open resumed> )        = 6
      [pid 21379] <... write resumed> )       = 1
      [pid 21381] lseek(6, 0, SEEK_CUR <unfinished ...>
      [pid 21379] write(0, "t", 1t <unfinished ...>
      [pid 21381] <... lseek resumed> )       = 0

--

i cannot tell if this is correct (stat64...=0)


the whole strace is attached. (sent to nikita)

after the test, the filesystem was _corrupt again_ (wasnt before) - fscp
output attached (also sent to nikita)

      ...
      Error: Node (23), item (4): StatData of the file
      [100de:636f6e74616374:100f1] has the wrong bytes (96966), Should be
      (11504).
      Plugin (stat40).
      Error: Node (23), item (5): StatData of the file
      [100de:667269656e642e:100f3] has the wrong bytes (55), Should be
      (5). Plugin
      (stat40).
      ...

--

p.s. i have harddrive writecache turned on - is this good/bad/should'nt
matter ? (again - no problems under reiser3)

hdparm /dev/hdb

/dev/hdb:
   multcount    = 16 (on)
   IO_support   =  1 (32-bit)
   unmaskirq    =  1 (on)
   using_dma    =  1 (on)
   readahead    = 256 (on)
   geometry     = 39770/16/63, sectors = 40088160, start = 0
   AdvancedPM=no WriteCache=enabled

regards
Willi


