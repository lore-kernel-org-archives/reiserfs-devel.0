From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Linux-2.6.9-rc2-bk7 Oops - ReiserFS: warning: vs-500: unknown
	uniqueness 126844928
Date: Thu, 23 Sep 2004 17:56:43 +0400
Message-ID: <1095947803.6378.31.camel@tribesman.namesys.com>
References: <20040922225859.GA12833@m.safari.iki.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040922225859.GA12833@m.safari.iki.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sami Farin <7atbggg02@sneakemail.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

On Thu, 2004-09-23 at 02:58, Sami Farin wrote:
> I got no replies for messages <20040713110437.GA4571@m.safari.iki.fi>
> and <20040714214146.GA23531@m.safari.iki.fi> to LKML,
> so I try again with latest releases.  Now using 2.6.9-rc2-bk7, and I
> guess reiserfs might be related somehow so you folks got Cc'ed. 
> reiserfsck 3.6.18 found no problems for the partition
> (/var, 1G) after reboot, I can access every file in there and I don't
> have hardware problems, memtest+ runs happily for 24 hours without
> errors and 2.4 series have also worked without too much
> unexplained Oopsings with the same hardware.  Besides, there's
> always the same 14000030 addresss...
> 
> Linux safari.finland.fbi 2.6.9-rc2-bk7 #4 SMP Wed Sep 22 15:25:34 EEST 2004 i686 i686 i386 GNU/Linux
>  
> Gnu C                  3.4.2

May I ask you to compile kernel with 2.95.3 and try to reproduce the
problem?

> Gnu make               3.80
> binutils               2.15.91.0.2
> util-linux             2.12
> mount                  2.12
> module-init-tools      3.1-pre5
> e2fsprogs              1.35
> jfsutils               1.0.24
> reiserfsprogs          3.6.18
> reiser4progs           line
> xfsprogs               2.3.9
> pcmcia-cs              3.2.7
> quota-tools            3.11.
> PPP                    2.4.2
> nfs-utils              1.0.6
> Linux C Library        2.3.3
> Dynamic linker (ldd)   2.3.3
> Procps                 3.2.3
> Net-tools              1.60
> Kbd                    1.12
> Sh-utils               5.2.1
> Modules Loaded         sch_hfsc cls_fw cls_route sch_ingress sch_red sch_tbf
> 	sch_teql sch_prio sch_gred cls_rsvp cls_rsvp6 cls_tcindex sch_cbq sch_dsmark
> 	ipt_ttl ipt_tos ipt_tcpmss ipt_sctp ipt_recent ipt_pkttype ipt_physdev ipt_mark
> 	ipt_mac ipt_iprange ipt_helper ipt_esp ipt_ecn ipt_dscp ipt_conntrack ipt_ah
> 	ipt_addrtype ipt_ULOG ipt_TOS ipt_TCPMSS ipt_SAME ipt_REDIRECT ipt_NOTRACK
> 	ipt_NETMAP ipt_MASQUERADE ipt_MARK ipt_DSCP ipt_CLASSIFY snd_seq_midi
> 	snd_seq_oss snd_seq_midi_event snd_seq lp parport_pc parport w83781d i2c_sensor
> 	i2c_piix4 mga tuner tvaudio msp3400 bttv video_buf i2c_algo_bit v4l2_common
> 	btcx_risc i2c_core videodev ohci_hcd loop ipt_connlimit ipt_length ipt_TARPIT
> 	dm_mod ipt_ECN ipt_state ipt_multiport ipt_owner cls_u32 sch_sfq sch_htb
> 	ipt_REJECT ip6t_LOG ipt_LOG ipt_limit ip6table_filter ip6_tables uhci_hcd md5
> 	ipv6 snd_ens1371 snd_rawmidi snd_seq_device snd_pcm_oss snd_mixer_oss
> 	iptable_raw iptable_mangle snd_pcm iptable_nat ip_conntrack iptable_filter
> 	ip_tables snd_timer snd_page_alloc snd_ac97_codec snd soundcore gameport irlan
> 	irda crc_ccitt 8139too mii floppy sg scsi_mod
> 
> 
> I got this oops when I was doing rpmbuild --rebuild ... 
> 

Does it crash on each rpmbuild --rebuild?

> 


