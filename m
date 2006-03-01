From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 unlink performance
Date: Wed, 1 Mar 2006 18:27:54 +0300
Message-ID: <200603011827.55282.zam@namesys.com>
References: <EE7B7176-15E7-43E9-937B-B084879E62A9@hilander.com> <4404A04F.5010902@namesys.com> <5630744B-8F94-4B23-A228-999F04BD3E58@hilander.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5630744B-8F94-4B23-A228-999F04BD3E58@hilander.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Alec H. Peterson" <ahp@hilander.com>, Hans Reiser <reiser@namesys.com>

On Tuesday 28 February 2006 22:19, Alec H. Peterson wrote:
> Hi Hans,
>
> On Feb 28, 2006, at 12:11, Hans Reiser wrote:
> > Please describe it in more detail.
>
> Well, the error I'm getting is this:
>
> Feb 21 13:10:22 ecbuild-10 kernel: WARNING: Flushing like mad: 16384
>
> The C program I'm running to do the test is this:

All files created by the program below have zero lentgh, correct?
Is it the same program as which triggered 'flushing like mad' ?
 
>
> main(int argc, char **argv)
> {
>    char buf[1024];
>    char dir[1024];
>    int i,j,k;
>    int ret;
>    int fd;
>    int *sequence;
>    struct timeval start, unlinktime, end;
>
>    if(argc != 2)
>    {
>      fprintf(stderr, "Usage: %s <base directory>\n", argv[0]);
>      exit(1);
>    }
>
>    strncpy(dir, argv[1], 1024);
>
>    if(chdir(dir))
>    {
>      perror("chdir");
>      exit(1);
>    }
>
>    for(i = 0; i < 256; i++)
>    {
>      snprintf(buf, 1024, "%d", i);
>      ret = mkdir(buf, S_IRWXU);
>      if(ret && (errno != EEXIST))
>      {
>        perror("mkdir");
>        exit(1);
>      }
>    }
>
>
>    {
>      sequence = sequence20000;
>      gettimeofday(&start, NULL);
>      fprintf(stderr, "Starting %d run %d.%d.\n",
>              256 * 20000, start.tv_sec, start.tv_usec);
>
>      for(i = 0; i < 256; i++)
>      {
>        for(j = 0; j < 20000; j++)
>        {
>          snprintf(buf, 1024, "%d/%d", i, j);
>          fd = open(buf, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
>          if(fd == -1)
>          {
>            perror("open");
>            exit(1);
>          }
>          close(fd);
>        }
>        fprintf(stderr, "Done %d\n", i);
>      }
>
>      gettimeofday(&unlinktime, NULL);
>      fprintf(stderr, "Starting %d unlink %d.%d, elapsed time was
> %d.\n", 256 * 20000, unlinktime.tv_sec, unlinktime.tv_usec,
> unlinktime.tv_sec - start.tv_sec);
>
>      for(i = 0; i < 20000; i++)
>      {
>        for(j = 0; j < 256; j++)
>        {
>          snprintf(buf, 1024, "%d/%d", j, sequence[i]);
>          unlink(buf);
>          if(fd == -1)
>          {
>            perror("unlink");
>            exit(1);
>          }
>        }
>        fprintf(stderr, "Done %d\n", i);
>      }
>
>      gettimeofday(&end, NULL);
>      fprintf(stderr, "Done with %d unlink %d.%d, elapsed time was %d.
> \n",
>              20000 * 256, end.tv_sec, end.tv_usec,
>              end.tv_sec - unlinktime.tv_sec);
>    }
>
>    exit(0);
> }
>
> sequence20000 is an array which contains a sequence from 1 to 20000
> randomly ordered.
>
> Alec
>

-- 
Alex.
