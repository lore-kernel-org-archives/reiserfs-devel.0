From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sun, 8 Aug 2004 21:38:29 -0500
Message-ID: <20040809024233.2557A15D98@mail03.powweb.com>
References: <4116BEED.8050804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4116BEED.8050804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>



One other somewhat related FYI. In the recent fibration discussion you
thought it would probably be good to make FIBRATION_EXT_1 the default
fibration plugin instead of FIBRATION_DOT_O, but dot-O is still the default:

	[PSET_FIBRATION] = {
		.type = REISER4_FIBRATION_PLUGIN_TYPE,
		.id   = FIBRATION_DOT_O
	},



David




