From: Anders Widman <andewid@tnonline.net>
Subject: Re: Kernel dump/segmentation failt
Date: Thu, 25 Apr 2002 14:48:28 +0200
Message-ID: <9115475765.20020425144828@tnonline.net>
References: <5412403953.20020425135717@tnonline.net>
 <20020425161720.A25504@namesys.com> <5314189578.20020425142702@tnonline.net>
 <20020425164016.C25504@namesys.com>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020425164016.C25504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Green <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

True, it takes 12 hours minimum to run --rebuild-tree. Also. I did
actually run --rebuild-tree (without -S) after I ran with -S. The
reason for this is that --check reported an error that could only be
fixed with "--rebuild-tree". The error is now gone, but I can't change
the data on the volume (in the lost+found folder).

Sure.. Backup would be best thing, but it seems a bit difficult to
find 800GB backup media.



//Anders



> Hello!

>    Given the size of your volume, I guess you do not want to run --rebuild-tree
>    (without -S) again.
>    And the only thing that you can do yourself is to backup all the stuff,
>    reformat and then put all the stuff back. (you said yo can access it in
>    read-only mode)

> Bye,
>     Oleg
> On Thu, Apr 25, 2002 at 02:27:02PM +0200, Anders Widman wrote:
>>   Yes, it seems so. I just had a look, and the "." and ".." are
>>   missing. Is there anything that I can do at this point to fix this
>>   problem myself?
>> 
>> 
>> //Anders
>> 
>> 
>> 
>> > Hello!
>> 
>> >    Thank you for the report.
>> >    This is a very similar crashdump like you've sent some time ago
>> >    (BUG at namei.c:1160). The problem itself seems to be related to
>> >    missing "." and ".." entries in lost+found dir (though it is not very
>> >    clear at this point why these entries were not created by reiserfsck).
>> 
>> >    We do not have any real solution right now, unfortunatelly.
>> >    But we are working on it.
>> 
>> > Bye,
>> >     Oleg
>> > On Thu, Apr 25, 2002 at 01:57:17PM +0200, Anders Widman wrote:
>> >> 
>> >>   After running reiserfsck -S --ebuild-tree to restore a filesystem I
>> >>   get lots of folders and files in lost+found named with numbers like
>> >>   2_1328. This is itself isn't the biggest problems. All subfolders
>> >>   are named correktly, as the files in those subfolders.
>> >> 
>> >>   However, when I try to change anything in the lost+found folder I
>> >>   get a segmentation fault and a kernel dump. I am using latest
>> >>   reiserfs tools with kernel 2.4.18-6 and kernel 2.4.18-7:
>> >> 
>> >>   ~~~~~~~~~~~~~~~~~~~~
>> >> Apr 25 12:24:22 server kernel: kernel BUG at namei.c:1160!
>> >> Apr 25 12:24:22 server kernel: invalid operand: 0000
>> >> Apr 25 12:24:22 server kernel: CPU:    0
>> >> Apr 25 12:24:22 server kernel: EIP:    0010:[<c017ad24>]    Not tainted  
>> >> Apr 25 12:24:22 server kernel: EFLAGS: 00010297
>> >> Apr 25 12:24:22 server kernel: eax: 00000000   ebx: dac57d1c   ecx: 062bb000   edx: dac57e0c
>> >> Apr 25 12:24:22 server kernel: esi: ffffffff   edi: dac57c7c   ebp: dab22c80   esp: dac57c40
>> >> Apr 25 12:24:22 server kernel: ds: 0018   es: 0018   ss: 0018 
>> >> Apr 25 12:24:22 server kernel: Process mv (pid: 1536, stackpage=dac57000)
>> >> Apr 25 12:24:22 server kernel: Stack: 00000002 00000000 dac57ca8 dac57d48 00000000 00000000 00000000 c0298f48
>> >> Apr 25 12:24:22 server kernel:        00000001 00000039 000f65d1 df638000 00001000 c0137088 00003a00 db084ba0
>> >> Apr 25 12:24:22 server kernel:        00000003 daf9a060 00000001 daf9a418 00000008 00000002 daf9aeb0 00000000
>> >> Apr 25 12:24:22 server kernel: Call Trace: [<c0137088>] [<c018af9b>] [<c018abff>] [<c0137088>] [<c0179773>]
>> >> Apr 25 12:24:22 server kernel:    [<c01663e1>] [<c0140590>] [<c012657e>] [<c0126e7a>] [<c0140b79>] [<c013e120>]
>> >> Apr 25 12:24:22 server kernel:    [<c013ee99>] [<c0140d7a>] [<c013dedd>] [<c010899b>]
>> >> Apr 25 12:24:22 server kernel:
>> >> Apr 25 12:24:22 server kernel: Code: 0f 0b 88 04 8e 49 29 c0 8b 84 24 cc 01 00 00 8b 94 c4 d0 01
>> >>   ~~~~~~~~~~~~~~~~~~~~
>> >> If I am mounting as read only I can read all files without a kernel
>> >> dump or segmentation fault.
>> >> 
>> >> //Anders
>> >> 
>> 

