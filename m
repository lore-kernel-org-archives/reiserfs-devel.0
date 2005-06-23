From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Fri, 24 Jun 2005 01:18:03 +0400
Message-ID: <17083.9995.105576.61184@gargle.gargle.HOWL>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	<p73d5qgc67h.fsf@verdi.suse.de>
	<42B86027.3090001@namesys.com>
	<20050621195642.GD14251@wotan.suse.de>
	<42B8C0FF.2010800@namesys.com>
	<84144f0205062223226d560e41@mail.gmail.com>
	<42BA67C9.7060604@namesys.com>
	<1119543302.4115.141.camel@tribesman.namesys.com>
	<42BAEEA1.2060305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BAEEA1.2060305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Pekka Enberg <penberg@gmail.com>, Alexander Zarochentcev <zam@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser writes:

[...]

 > I think the above is easier to read than the below.  Macros can obscure
 > sometimes, and one of our weaknesses is a tendency to use macros in such
 > a way that it frustrates meta-. use in emacs.   Nikita did however
 > mention that there was something that could understand macros when
 > constructing tags files, but I forgot what that was.

xref.el (http://xref-tech.com/xrefactory/main.html). With it one can
type current->[TAB] and it shows fields of struct task_struct in the
emacs completion buffer.

Nikita.
