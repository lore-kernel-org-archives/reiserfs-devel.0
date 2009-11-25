From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Fyi - reiser4-for-opensuse-11-2 modules
Date: Tue, 24 Nov 2009 20:40:43 -0500
Message-ID: <4B0C8B1B.3090303@suse.com>
References: <1cac2993289c0385dc7ec3754b53a59c@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1cac2993289c0385dc7ec3754b53a59c@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 11/23/2009 07:39 AM, doiggl@velocitynet.com.au wrote:
> Fyi 
> May be of interest.
> http://lizards.opensuse.org/2009/11/15/reiser4-for-opensuse-11-2/

Any reason you didn't create a submitreq for the updated packages to be
included in the official 11.2 release?

It's pretty easy to do: just create a branch of the drivers:filesystems
reiser4-kmp package, do your changes, and then do "osc sr" for it to
create a submitreq.

I'm glad someone is stepping up to do this since I haven't had a lot of
time to track reiser4.

-Jeff

-- 
Jeff Mahoney
SUSE Labs
