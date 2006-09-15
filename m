From: David Masover <ninja@slaphack.com>
Subject: Re: v3 rebuild-tree left system in unusable state because of space
 shortage
Date: Fri, 15 Sep 2006 17:14:22 -0500
Message-ID: <450B25BE.2090904@slaphack.com>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com> <200609151343.39692.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609151343.39692.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

> while there is no fix currently for this problem you can solve the problem by expanding underlaying device.

Just curious, could it also be fixed by mounting the FS, freeing up some 
space, then retrying the FSCK?  Or is the FS unusable?
