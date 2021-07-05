/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mgavillo <mgavillo@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/19 15:46:35 by mgavillo          #+#    #+#             */
/*   Updated: 2021/02/08 21:24:35 by mgavillo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef	LIBASM_H
# define LIBASM_H

# include <string.h>
# include <unistd.h>
# include <stdio.h>
# include <fcntl.h>
# include <stdlib.h>

# define RESET   "\033[0m"
# define RED     "\033[31m"
# define GREEN   "\033[32m"

ssize_t		ft_write(int, char *, size_t);
ssize_t		ft_read(int, char *, size_t);
ssize_t		ft_strlen(char *);
char		*ft_strcpy(char *, char *);
int			ft_strcmp(char *, char *);
char		*ft_strdup(char *);

typedef struct	s_list
{
	void 			*data;
	struct s_list 	*next;
} 				t_list;

//attention valeur de retour
int         ft_list_size(t_list *lst);
int       	ft_list_push_front(t_list **list, void *data);
int			ft_list_sort(t_list **list, int (*cmp)());
int         ft_list_remove_if(t_list **list, void *data, int (*cmp)());
int         ft_atoi_base(char *str, char *base);

t_list		*ft_create_elem(void *data);

#endif
