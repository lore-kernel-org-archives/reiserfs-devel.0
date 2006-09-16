From: "=?ISO-8859-2?Q?Grzegorz_Ja=B6kiewicz?=" <gryzman@gmail.com>
Subject: Re: Re: v3 rebuild-tree left system in unusable state because of space shortage
Date: Sat, 16 Sep 2006 14:18:11 +0200
Message-ID: <2f4958ff0609160518l307df492i814c35f90bb3eeb5@mail.gmail.com>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com>
	 <200609151343.39692.vs@namesys.com>
	 <2f4958ff0609150334l2f52574el151e1dcff1f721be@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0609150334l2f52574el151e1dcff1f721be@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

it worked okay.
now I wonder, if I can use your instructions to "join" 120GB partition
with new 220GB one, where the later one is the current one, and I
would like to extend it to 220+120GB.
220 one is /dev/hda3 , the one that I would like to attach to the end
of it is /dev/hdc3.
how can I do this without destructing data on the first one? I guess I
should use MD ? right ?
