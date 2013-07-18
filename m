From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] reiserfs: check/extend buffer length for printing
 functions
Date: Thu, 18 Jul 2013 08:43:17 +0100
Message-ID: <20130718074316.GY4165@ZenIV.linux.org.uk>
References: <51E65A68.8070009@asianux.com>
 <51E76ED7.303@asianux.com>
 <51E7994D.1060300@asianux.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E7994D.1060300@asianux.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <gang.chen@asianux.com>
Cc: George Spelvin <linux@horizon.com>, reiserfs-devel@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Jul 18, 2013 at 03:29:17PM +0800, Chen Gang wrote:
> On 07/18/2013 12:28 PM, Chen Gang wrote:
> >  
> >>  	strcpy(fmt1, fmt);
> >> @@ -199,46 +214,51 @@ static void prepare_error_buf(const char *fmt, va_list args)
> >>  	while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
> >>  		*k = 0;
> >>  
> >> -		p += vsprintf(p, fmt1, args);
> >> +		p += vsnprintf(p, left, fmt1, args);
> 
> At least, need use vscnprintf() instead of vsnprintf(), since we need
> the real written length return.

		n = vsnprintf(p, left, ....);
		left -= n;
		if (left <= 0) /* overflow */
			break;	/* or whatever's suitable here */
		p += n;
