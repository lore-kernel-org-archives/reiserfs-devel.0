From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: reiserfs vs NTFS vs WAFL
Date: Thu, 22 May 2003 12:55:01 +0200
Message-ID: <20030522105501.GX7706@vestdata.no>
References: <20030520213130.40f9f249.philippe.gramoulle@mmania.com> <003101c31fa3$3ac20530$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <003101c31fa3$3ac20530$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: darren <teodarren@myrealbox.com>
Cc: 'reiserfs' <reiserfs-list@namesys.com>

On Wed, May 21, 2003 at 10:13:57PM +0800, darren wrote:
> Hi all,
>=20
> I wonder if there are any papers or benchmarks that compare the
> performance and architectural differences between reiserfs, NTFS and
> WAFL (NetApp's Write Anywhere File Layout)?

I did some benchmarking of linux vs NetApp benchmarking a long time
ago.

We used "postmark" to perform the benchmark, with default settings,
except:
number 20000
transactions 50000

Information on postmark is available at
http://www.netapp.com/tech_library/3022.html. Later I have learned that
postmark is probably not the best general-purpose benchmarking tool, so
the numbers may not be representative for the average workload.

All tests were done with a single NFS-client, a linux PC. (linux 2.2,
NFS v2).

The servers were:
1. NetApp 760, with FC disks
2. x86 PC, single SCSI-disk, linux 2.2, ext2, NFSv2
3. x86 PC, single SCSI-disk, linux 2.2, reiserfs v3.5.5, NFSv2


Results, transactions pr second:
1: 82 transactions/s
2: 43 transactions/s
3: 66 transactions/s

So, in this test the $100k NetApp was approxemately 24% faster than the
$1k linux workstation.


Now, there are many obvious flaws in this test, in no particular order:
- The benchmark-tool may not be the best
- A single client is not sufficient to represent a typical production-
  enviroment
- The linux-server should have had RAID
- The tests should have been repeated and averaged
- It's old. Terribly old.


So, take the results with a grain of salt.
It would be great run some new benchmarks (e.g. SPEC sfs) on a properly
spec'ed linux/reiserfs system, but personally I don't have the hardware
available just now.



--=20
Ragnar Kj=F8rstad
Zet.no
