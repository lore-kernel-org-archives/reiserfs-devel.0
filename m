From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 needs some love with baselayout-2 / openrc
Date: Fri, 18 Jan 2008 17:26:06 +0300
Message-ID: <4790B6FE.60607@gmail.com>
References: <loom.20080118T124400-9@post.gmane.org> <loom.20080118T131323-824@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080118T131323-824@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Mat wrote:

>would it be safe to assume -p ("preen") doing the same like -a ("auto") with
>modified reiser4progs?
>
>case 'p':
>                        aal_set_bit(&data->options, FSCK_OPT_AUTO);
>                        break;
>
>  
>

Does it help by the way?

It is safe, but it breaks semantic (some getting-started-with-xxx-plugin 
docs
will need to be edited)
 

>then gentoo init / baselayout wouldn't halt at printing plugins & omitting
>checkfs, thus all other following services/tasks
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

