From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.14 release
Date: Fri, 19 Mar 2004 12:23:06 +0300
Message-ID: <200403191223.06492.vitaly@namesys.com>
References: <200403182350.44277.vitaly@namesys.com> <m3hdwloom3.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3hdwloom3.fsf@multivac.cwru.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Jarc <prj@po.cwru.edu>, reiserfs-list@namesys.com

Hello Paul,

this was changed in 3.6.15-pre1, would you try it?

-- 
Thanks,
Vitaly Fertman

On Friday 19 March 2004 00:02, Paul Jarc wrote:
> My /bin/sh is pdksh, which handles here-documents slightly differently
> from bash: for some sequences like \", the backslash is preserved by
> bash, but removed by pdksh.  To ensure that a backslash appears in the
> here-document, you can escape the backslash with another backslash.
> This patch (against 3.6.13, but the problem and fix are the same for
> 3.6.14) makes the configure script work with pdksh as well as bash.
>
> --- reiserfsprogs-3.6.13/configure.in~	2004-03-10 17:21:56.000000000 -0500
> +++ reiserfsprogs-3.6.13/configure.in	2004-03-10 17:22:42.000000000 -0500
> @@ -110,7 +110,7 @@
>  		fprintf(fout, ",\n\n");
>
>  	    line[strlen(line) - 1] = 0;
> -	    fprintf(fout, "\t\"%s\\\n\"", line);
> +	    fprintf(fout, "\\t\\"%s\\\\n\\"", line);
>  	    start = 0;
>  	}
>      }
>
>
> paul

