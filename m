From: Mat <jackdachef@gmail.com>
Subject: Re: reiser4 needs some love with baselayout-2 / openrc
Date: Fri, 18 Jan 2008 13:19:58 +0000 (UTC)
Message-ID: <loom.20080118T131323-824@post.gmane.org>
References: <loom.20080118T124400-9@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

would it be safe to assume -p ("preen") doing the same like -a ("auto") with
modified reiser4progs?

case 'p':
                        aal_set_bit(&data->options, FSCK_OPT_AUTO);
                        break;


then gentoo init / baselayout wouldn't halt at printing plugins & omitting
checkfs, thus all other following services/tasks

