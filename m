From: berthiaume_wayne@emc.com
Subject: lk 2.4.19 ReiserFS Build
Date: Fri, 9 Aug 2002 14:16:15 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFE51@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C23FD0.D9B217B0"
Return-path: <reiserfs-list-return-11151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: mason@suse.com, green@namesys.com
Cc: reiserfs-list@namesys.com, Mizar_Sunita@emc.com

------_=_NextPart_000_01C23FD0.D9B217B0
Content-Type: text/plain;
	charset="iso-8859-1"

	Chris/Oleg, I'm planning to build 2.4.19-final and would like to get
ReiserFS up to the latest stable patch level. I'm looking at the following
but have noticed in a message from Manuel Krause that there are some Namesys
patches he has been testing successfully. 

		Namesys Patch List used by MK from 2.4.19-pre:

		01.change_help_wording
		02.change_menu_wording
		03.confusing_journal_replay_warning_removal
		05.hash_on_empty_fs-1

		Not Used by MK:

		04.replay_bug_fix
		06.get_virtual_node_size_64bitarch_fix (I assume this is
only for Itanium)

		CM Patch list

		01-relocation-4
		02-commit_super-9-relocation
		03-data-logging-25
		03-logging-export
		04-write_times
		05-search_reada-4

	Also, what is the status of write-barrier? Should I be considering
it on a production system? My goal is to improve performance and reduce the
window for data coruption due to power failures.
Thanks and regards,

Wayne
"One man can make a difference, and every man should try."  - JFK

 <<Wayne Berthiaume (E-mail).vcf>> 

------_=_NextPart_000_01C23FD0.D9B217B0--
