From: John Cohorn <elotemuygrande@gmail.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Fri, 17 Feb 2006 10:43:42 -0600
Message-ID: <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
	 <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_5412_17464410.1140194622878"
Return-path: <reiserfs-list-return-28087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_5412_17464410.1140194622878
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Is there a known issue with 2.6.16-xxx-mm1? I too am having severe and very
random, but reproducible problems which will completely lock up my machine
minutes after mounting an R4 partition if not seconds. I did try disabling
4K stacks in my .config. Also, this is an Athlon 64 X2 I'm running with so
maybe there are SMP issues? One of my friends said that Reiser4 became
unstable for him also when he upgraded to a dual core Athlon64...but until =
I
test for myself that's just a wild theory that it's an SMP bug. This machin=
e
is otherwise stable in Memtest, in Windows playing the latest games, and on
Linux compiling huge amounts of software.

If there are not known issues with the latest kernels then I will happily
try to send detailed configurations and logs of what's happening this
evening. I have two shiny new 250GB SATA drives on my machine and I can tes=
t
freely with one of them until I need the space. I'd love to help squash any
bugs that I can :)


On 2/16/06, Andrew James Wade <andrew.j.wade@gmail.com> wrote:
>
> On Friday 10 February 2006 09:22, Maarten Deprez wrote:
> > Hello,
> >
> > reiser4 on linux 2.6.16-rc2-mm1 bugs for me in
> > plugins/file/tail_conversion.c line 29, locking up a process
> > sometimes, when it is reading a file.
> >
> > Greetings,
> > Maarten Deprez
> >
> >
>
> Still present in 2.6.16-rc3-mm1:
>
> ------------[ cut here ]------------
> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:81!
> invalid opcode: 0000 [#1]
> PREEMPT
> last sysfs file: /devices/pci0000:00/0000:00:01.0/0000:01:00.0/i2c-0/name
> CPU:    0
> EIP:    0060:[get_nonexclusive_access+30/49]    Not tainted VLI
> EFLAGS: 00010286   (2.6.16-rc3-mm1 #2)
> EIP is at get_nonexclusive_access+0x1e/0x31
> eax: cc2ec288   ebx: 00000000   ecx: cb87d4e8   edx: 00000000
> esi: cb87d4e8   edi: 00000000   ebp: d30ba574   esp: d3934e00
> ds: 007b   es: 007b   ss: 0068
> Process kmail (pid: 21299, threadinfo=3Dd3934000 task=3Dd8577570)
> Stack: <0>c01ca9ae d94d157c d3934ed8 cb87d540 0000000f 00000000 00320af1
> 00000000
>        df136ef4 0000f000 00000000 d20b2494 00001000 d94d158c ffffffff
> ffffffff
>        ffffffff ffffffff 00000127 00000000 43f543c8 2ac0f373 00000000
> d94d158c
> Call Trace:
> <c01ca9ae> write_extent+0x68d/0xbc3   <c01cd0e2>
> item_length_by_coord+0xb/0xf
> <c01c8125> nr_units_extent+0x5/0xd   <c01c94ef>
> init_coord_extension_extent+0x60/0xdf
> <c01b5031> set_file_state+0x26/0x5b   <c01b5128> find_file_item+0xc2/0xd4
> <c01ca321> write_extent+0x0/0xbc3   <c01b6c46> write_flow+0x248/0x2df
> <c01b74bc> write_unix_file+0x343/0x4cc   <c01345f6>
> lru_cache_add_active+0x47/0x5d
> <c01b7179> write_unix_file+0x0/0x4cc   <c01488f5> vfs_write+0x83/0x122
> <c014910e> sys_write+0x3c/0x63   <c0102ac7> sysenter_past_esp+0x54/0x75
> Code: 81 c4 b0 00 00 00 89 e8 5b 5e 5f 5d c3 85 d2 89 c1 75 20 b8 00 f0 f=
f
> ff 21 e0 8b 00 8b 80 c4 04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 51 00=
 b8
> b8 38 c0 89 c8 ff 00 0f 88 e1 06 00 00 c3 55 ba
> <4><4>reiser4[kmail(21299)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
> <4>reiser4[kmail(21299)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
> WARNING: out of memory?
> ...
>
>

------=_Part_5412_17464410.1140194622878
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Is there a known issue with 2.6.16-xxx-mm1? I too am having severe and
very random, but reproducible problems which will completely lock up my
machine minutes after mounting an R4 partition if not seconds. I did
try disabling 4K stacks in my .config. Also, this is an Athlon 64 X2
I'm running with so maybe there are SMP issues? One of my friends said
that Reiser4 became unstable for him also when he upgraded to a dual
core Athlon64...but until I test for myself that's just a wild theory
that it's an SMP bug. This machine is otherwise stable in Memtest, in
Windows playing the latest games, and on Linux compiling huge amounts
of software.<br>
<br>
If there are not known issues with the latest kernels then I will
happily try to send detailed configurations and logs of what's
happening this evening. I have two shiny new 250GB SATA drives on my
machine and I can test freely with one of them until I need the space.
I'd love to help squash any bugs that I can :)<br>
<br><br><div><span class=3D"gmail_quote">On 2/16/06, <b class=3D"gmail_send=
ername">Andrew James Wade</b> &lt;<a href=3D"mailto:andrew.j.wade@gmail.com=
">andrew.j.wade@gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_q=
uote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0=
pt 0.8ex; padding-left: 1ex;">
On Friday 10 February 2006 09:22, Maarten Deprez wrote:<br>&gt; Hello,<br>&=
gt;<br>&gt; reiser4 on linux 2.6.16-rc2-mm1 bugs for me in<br>&gt; plugins/=
file/tail_conversion.c line 29, locking up a process<br>&gt; sometimes, whe=
n it is reading a file.
<br>&gt;<br>&gt; Greetings,<br>&gt; Maarten Deprez<br>&gt;<br>&gt;<br><br>S=
till present in 2.6.16-rc3-mm1:<br><br>------------[ cut here ]------------=
<br>kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:81!<br>invalid o=
pcode: 0000 [#1]
<br>PREEMPT<br>last sysfs file: /devices/pci0000:00/0000:00:01.0/0000:01:00=
.0/i2c-0/name<br>CPU:&nbsp;&nbsp;&nbsp;&nbsp;0<br>EIP:&nbsp;&nbsp;&nbsp;&nb=
sp;0060:[get_nonexclusive_access+30/49]&nbsp;&nbsp;&nbsp;&nbsp;Not tainted =
VLI<br>EFLAGS: 00010286&nbsp;&nbsp; (2.6.16-rc3-mm1 #2)<br>EIP is at get_no=
nexclusive_access+0x1e/0x31
<br>eax: cc2ec288&nbsp;&nbsp; ebx: 00000000&nbsp;&nbsp; ecx: cb87d4e8&nbsp;=
&nbsp; edx: 00000000<br>esi: cb87d4e8&nbsp;&nbsp; edi: 00000000&nbsp;&nbsp;=
 ebp: d30ba574&nbsp;&nbsp; esp: d3934e00<br>ds: 007b&nbsp;&nbsp; es: 007b&n=
bsp;&nbsp; ss: 0068<br>Process kmail (pid: 21299, threadinfo=3Dd3934000 tas=
k=3Dd8577570)
<br>Stack: &lt;0&gt;c01ca9ae d94d157c d3934ed8 cb87d540 0000000f 00000000 0=
0320af1 00000000<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; df136ef4 0000f000 =
00000000 d20b2494 00001000 d94d158c ffffffff ffffffff<br>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; ffffffff ffffffff 00000127 00000000 43f543c8 2ac0f373 00=
000000 d94d158c
<br>Call Trace:<br> &lt;c01ca9ae&gt; write_extent+0x68d/0xbc3&nbsp;&nbsp; &=
lt;c01cd0e2&gt; item_length_by_coord+0xb/0xf<br> &lt;c01c8125&gt; nr_units_=
extent+0x5/0xd&nbsp;&nbsp; &lt;c01c94ef&gt; init_coord_extension_extent+0x6=
0/0xdf<br> &lt;c01b5031&gt; set_file_state+0x26/0x5b&nbsp;&nbsp; &lt;c01b51=
28&gt; find_file_item+0xc2/0xd4
<br> &lt;c01ca321&gt; write_extent+0x0/0xbc3&nbsp;&nbsp; &lt;c01b6c46&gt; w=
rite_flow+0x248/0x2df<br> &lt;c01b74bc&gt; write_unix_file+0x343/0x4cc&nbsp=
;&nbsp; &lt;c01345f6&gt; lru_cache_add_active+0x47/0x5d<br> &lt;c01b7179&gt=
; write_unix_file+0x0/0x4cc&nbsp;&nbsp; &lt;c01488f5&gt; vfs_write+0x83/0x1=
22
<br> &lt;c014910e&gt; sys_write+0x3c/0x63&nbsp;&nbsp; &lt;c0102ac7&gt; syse=
nter_past_esp+0x54/0x75<br>Code:
81 c4 b0 00 00 00 89 e8 5b 5e 5f 5d c3 85 d2 89 c1 75 20 b8 00 f0 ff ff
21 e0 8b 00 8b 80 c4 04 00 00 8b 40 40 83 78 08 00 74 08 &lt;0f&gt; 0b
51 00 b8 b8 38 c0 89 c8 ff 00 0f 88 e1 06 00 00 c3 55 ba<br> &lt;4&gt;&lt;4=
&gt;reiser4[kmail(21299)]: release_unix_file (fs/reiser4/plugin/file/file.c=
:2674)[vs-44]:<br>WARNING: out of memory?<br>&lt;4&gt;reiser4[kmail(21299)]=
: release_unix_file (fs/reiser4/plugin/file/file.c:2674)[vs-44]:
<br>WARNING: out of memory?<br>...<br><br></blockquote></div><br>

------=_Part_5412_17464410.1140194622878--
