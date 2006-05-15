From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: Kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80
Date: Mon, 15 May 2006 23:27:13 +0400
Message-ID: <b5d90b2a0605151227n77a48810rce8fb2b3638b4bd5@mail.gmail.com>
References: <b5d90b2a0605061419o66bbefa7r8f90d728afe2e4bf@mail.gmail.com>
	 <200605111623.57751.zam@namesys.com>
	 <b5d90b2a0605111319v1a3e1a98hba99d48aa0d3942b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b5d90b2a0605111319v1a3e1a98hba99d48aa0d3942b@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!

Did it reach the list?
I'm a bit worried cause I'm stuck at 2.6.15 and I really want to
upgrade to .16. :)

Thanks.

On 5/12/06, Alexey Polyakov <alexey.polyakov@gmail.com> wrote:
> Hi,
>
> after running for a couple hours, kernel reports a different bug. Then
> again processes get stuck in D state, and only hard reset helps.
>
> Here's this new error message:
>
> May 11 07:19:22 titanic kernel: <4>reiser4[httpd(11176)]:
> plugin_by_unsafe_id (fs/reiser4/plugin/plugin.c:296)[nikita-2913]:
> May 11 07:19:22 titanic kernel: WARNING: Invalid plugin id: [2:235]
> May 11 07:19:22 titanic kernel: Unable to handle kernel NULL pointer
> dereference at 0000000000000004 RIP:
> May 11 07:19:22 titanic kernel: <ffffffff80229461>{obtain_item_plugin+17}
> May 11 07:19:22 titanic kernel: PGD 37d86067 PUD e1ba8067 PMD 0
> May 11 07:19:22 titanic kernel: Oops: 0000 [1] SMP
> May 11 07:19:22 titanic kernel: CPU 3
> May 11 07:19:22 titanic kernel: Modules linked in:
> May 11 07:19:22 titanic kernel: Pid: 11176, comm: httpd Not tainted
> 2.6.16-cks9 #2
> May 11 07:19:22 titanic kernel: RIP: 0010:[<ffffffff80229461>]
> <ffffffff80229461>{obtain_item_plugin+17}
> May 11 07:19:22 titanic kernel: RSP: 0018:ffff8100edd39b48  EFLAGS: 00010=
292
> May 11 07:19:22 titanic kernel: RAX: 0000000000000000 RBX:
> ffff81016df732d0 RCX: ffffffff80406c68
> May 11 07:19:22 titanic kernel: RDX: 0000000000000000 RSI:
> 0000000000000292 RDI: ffffffff80406c60
> May 11 07:19:22 titanic kernel: RBP: ffff81016df732d0 R08:
> 0000000000000003 R09: 0000000000000001
> May 11 07:19:22 titanic kernel: R10: 0000000000000000 R11:
> ffffffff80118cd0 R12: ffff81013e91f000
> May 11 07:19:22 titanic kernel: R13: ffffffff80419000 R14:
> ffff81013e91f4f0 R15: 0000000000000000
> May 11 07:19:22 titanic kernel: FS:  00002ab7a85cc8e0(0000)
> GS:ffff8101045370c0(0000) knlGS:0000000000000000
> May 11 07:19:22 titanic kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 000000008005003b
> May 11 07:19:22 titanic kernel: CR2: 0000000000000004 CR3:
> 00000000d9e67000 CR4: 00000000000006e0
> May 11 07:19:22 titanic kernel: Process httpd (pid: 11176, threadinfo
> ffff8100edd38000, task ffff810037d3f100)
> May 11 07:19:23 titanic kernel: Stack: ffff81016df732d0
> ffffffff801f14d1 ffff81016df732d0 ffffffff801f17ad
> May 11 07:19:23 titanic kernel:        0000000000000001
> ffffffff801ed372 ffff8100edd39b70 ffffffff00000001
> May 11 07:19:23 titanic kernel:        0000000000000000 0000000000000000
> May 11 07:19:23 titanic kernel: Call Trace:
> <ffffffff801f14d1>{coord_num_units+17}
> <ffffffff801f17ad>{coord_init_after_item_end+13}
> May 11 07:19:23 titanic kernel:
> <ffffffff801ed372>{carry_insert_flow+1106}
> <ffffffff801eb9ab>{carry+267}
> May 11 07:19:23 titanic kernel:
> <ffffffff801eac05>{post_carry+85} <ffffffff801ef267>{insert_flow+263}
> May 11 07:19:23 titanic kernel:
> <ffffffff80221de5>{write_tail+245} <ffffffff801e8e35>{jload_gfp+437}
> May 11 07:19:23 titanic kernel:
> <ffffffff80211bbe>{extent2tail+942}
> <ffffffff8020fd40>{release_unix_file+192}
> May 11 07:19:23 titanic kernel:        <ffffffff80179d02>{__fput+194}
> <ffffffff80162a01>{remove_vma+65}
> May 11 07:19:23 titanic kernel:
> <ffffffff8016417e>{do_munmap+670} <ffffffff801649e2>{sys_munmap+82}
> May 11 07:19:23 titanic kernel:        <ffffffff8010aaf6>{system_call+126=
}
> May 11 07:19:23 titanic kernel:
> May 11 07:19:23 titanic kernel: Code: 0f be 40 04 88 43 0c 5b c3 66 66
> 90 66 66 90 53 0f b6 47 0c
> May 11 07:19:23 titanic kernel: RIP
> <ffffffff80229461>{obtain_item_plugin+17} RSP <ffff8100edd39b48>
> May 11 07:19:23 titanic kernel: CR2: 0000000000000004
>
>
> On 5/11/06, Alexander Zarochentsev <zam@namesys.com> wrote:
> > Hello.
> >
> > please apply the attached patch.
>
>
> --
> Alexey Polyakov
>


--=20
Alexey Polyakov
